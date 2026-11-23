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
                bad debt.
            </p>

            <p>
                Investigate the discrepancy before
                considering any write-off.
            </p>
        `;

    } else {

        result.innerHTML = `
            <p>Please select a decision first.</p>
        `;
    }
}
