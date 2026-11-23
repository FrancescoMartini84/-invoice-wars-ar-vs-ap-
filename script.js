function evaluateDecision() {

    const decision =
        document.getElementById("decision").value;

    const result =
        document.getElementById("result");

    result.style.display = "block";

    if (decision === "hold") {

        result.innerHTML = `
            <h3>Correct decision!</h3>

            <p>
                The $250 balance should remain open
                while the dispute is investigated.
            </p>

            <p>
                AR should request supporting evidence
                from the customer.
            </p>

            <p>
                AP should verify whether the supplier
                issued an approved credit memo.
            </p>

            <strong>
                Status: Pending documentation.
            </strong>
        `;

    } else if (decision === "credit") {

        result.innerHTML = `
            <h3>Incorrect accounting treatment!</h3>

            <p>
                A disputed deduction is not automatically
                grounds for issuing a customer credit.
            </p>

            <p>
                Investigate the discrepancy and verify
                the supporting documentation first.
            </p>
        `;

    } else if (decision === "writeoff") {

        result.innerHTML = `
            <h3>Incorrect accounting treatment!</h3>

            <p>
                A disputed balance should not automatically
                be written off as bad debt.
            </p>

            <p>
                The company must investigate the claim,
                review collection efforts, and obtain
                the required approval before considering
                a write-off.
            </p>

            <strong>
                Status: Dispute investigation required.
            </strong>
        `;

    } else {

        result.innerHTML = `
            <p>Please select a decision first.</p>
        `;
    }
}
