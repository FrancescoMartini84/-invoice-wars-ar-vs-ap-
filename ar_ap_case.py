### ### File 2 — `ar_ap_case.py`

This is the Python component. It calculates the outstanding balance and evaluates the dispute.

```python
# Invoice Wars: AR vs. AP
# Educational bookkeeping simulation

company = "Sterling Office Solutions LLC"

customer = "Greenfield Medical Group"

invoice_amount = 2650.00
payment_received = 250.00
claimed_deduction = 2400.00

supplier_credit_received = False


def calculate_balance(invoice, payment):
    return round(invoice - payment, 2)


def evaluate_dispute():
    balance = calculate_balance(
        invoice_amount,
        payment_received
    )

    print("\n INVOICE WARS: AR vs. AP")
    print("------------------------------")

    print("Company", company)
    print("Customer", customer)

    print(f"Invoice: ${invoice_amount:.2f}")
    print(f"Payment: ${payment_received:.2f}")
    print(f"Outstanding: ${balance:.2f}")

    print(f"Claimed deduction: ${claimed_deduction:.2f}")

    if balance == claimed_deduction:
        print("\nSTATUS: SHORT PAYMENT IDENTIFIED")

    if not_supplier_received:
        print("SUPPLER CREDIT: NOT RECEIVED")
        print("ACTION: Keep the disputed balance open.")
        print("REQUEST: Obtain supporting documentation.")

    print("\nAR and AP reconciliation remains pending.")


if __name__ == "__main__":
    evaluate_dispute()













