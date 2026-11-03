-- Calcolo della struttura delle Tranches (Debt Sizing & Weights)
SELECT 
    t.company_name AS [Target],
    dt.tranche_name AS [Tipo di Debito],
    dt.principal_amount AS [Ammontare Tranche],
    dt.interest_rate_pct || '%' AS [Tasso d'Interesse],
    
    -- Calcolo del peso percentuale di questa tranche sul debito totale del deal
    ROUND(
        (dt.principal_amount / SUM(dt.principal_amount) OVER(PARTITION BY dt.deal_id)) * 100, 
        1
    ) || '%' AS [% sul Debito Totale]

FROM deal_debt_tranches dt
JOIN deals d ON dt.deal_id = d.deal_id
JOIN target_companies t ON d.target_id = t.target_id;