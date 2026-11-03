- Analisi di Sostenibilità della Leva (Interest Coverage Ratio) 
SELECT 
    t.company_name AS [Target],
    t.free_cash_flow AS [Free Cash Flow (FCF)],
    
    -- Calcoliamo il costo totale degli interessi annui combinando le tranches
    ROUND(SUM(dt.principal_amount * (dt.interest_rate_pct / 100.0)), 2) AS [Interessi Annui Totali],
    
    -- FCF / Interessi Totali (Interest Coverage Ratio basato sul cassa)
    ROUND(t.free_cash_flow / SUM(dt.principal_amount * (dt.interest_rate_pct / 100.0)), 2) AS [FCF / Interest Coverage]

FROM deals d
JOIN target_companies t ON d.target_id = t.target_id
JOIN deal_debt_tranches dt ON d.deal_id = dt.deal_id
GROUP BY t.target_id;
