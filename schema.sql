
-- ============================================
-- INVOICE CONFLICTS
-- AR/AP Reconciliation Database
-- PostgreSQL
-- ============================================

-- 1. CUSTOMERS

CREATE TABLE customers (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(150) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 2. SUPPLIERS

CREATE TABLE suppliers (
    supplier_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 3. ACCOUNTS RECEIVABLE INVOICES

CREATE TABLE invoices (
    invoice_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    invoice_number VARCHAR(50) NOT NULL UNIQUE,
    customer_id INTEGER NOT NULL,
    invoice_date DATE NOT NULL,
    due_date DATE,
    invoice_amount NUMERIC(12, 2) NOT NULL,

    CONSTRAINT fk_invoice_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT chk_invoice_amount
        CHECK (invoice_amount > 0)
);


-- 4. CUSTOMER PAYMENTS

CREATE TABLE payments (
    payment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount NUMERIC(12, 2) NOT NULL,

    CONSTRAINT fk_payment_invoice
        FOREIGN KEY (invoice_id)
        REFERENCES invoices(invoice_id),

    CONSTRAINT chk_payment_amount
        CHECK (payment_amount > 0)
);


-- 5. CUSTOMER DISPUTES

CREATE TABLE disputes (
    dispute_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    claimed_amount NUMERIC(12, 2) NOT NULL,
    dispute_reason TEXT NOT NULL,

    dispute_status VARCHAR(30) NOT NULL DEFAULT 'open',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_dispute_invoice
        FOREIGN KEY (invoice_id)
        REFERENCES invoices(invoice_id),

    CONSTRAINT chk_disputed_amount
        CHECK (claimed_amount > 0),

    CONSTRAINT chk_dispute_status
        CHECK (
            dispute_status IN (
                'open',
                'under_review',
                'resolved',
                'rejected'
            )
        )
);


-- 6. SUPPLIER CREDIT MEMOS

CREATE TABLE supplier_credit_memos (
    credit_memo_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    dispute_id INTEGER NOT NULL,

    credit_memo_number VARCHAR(50) UNIQUE,
    credit_amount NUMERIC(12, 2),

    memo_status VARCHAR(30) NOT NULL DEFAULT 'pending',

    received_date DATE,

    CONSTRAINT fk_memo_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id),

    CONSTRAINT fk_memo_dispute
        FOREIGN KEY (dispute_id)
        REFERENCES disputes(dispute_id),

    CONSTRAINT chk_credit_amount
        CHECK (
            credit_amount IS NULL
            OR credit_amount > 0
        ),

    CONSTRAINT chk_memo_status
        CHECK (
            memo_status IN (
                'pending',
                'received',
                'approved',
                'rejected'
            )
        )
);


-- ============================================
-- END OF DATABASE STRUCTURE
-- ============================================
