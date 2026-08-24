<h1 align="center">Insurance Claim Analytics Platform</h1> <h2 align="center">Operational Efficiency & Risk Detection Platform</h2><p align="center">

<p align="center">
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white" alt="R">
  <img src="https://img.shields.io/badge/Html-3776AB?style=for-the-badge&logo=html&logoColor=white" alt="Html">
  <img src="https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=RStudio&logoColor=white" alt="RStudio">
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" alt="Status">
</p>

<hr>

<h2>Table of Contents</h2>

<ol>
  <li><a href="#sec1">Business Overview</a></li>
  <li><a href="#sec2">Key Benefits</a></li>
  <li><a href="#sec3">Project Objectives</a></li>
  <li><a href="#sec4">Repository Layout</a></li>
  <li><a href="#sec5">Technology Infrastructure</a></li>
  <li><a href="#sec6">Critical Insights</a>
    <ul>
      <li><a href="#sec6-1">Time-to-Resolution Metrics</a></li>
      <li><a href="#sec6-2">Fraud Indicators</a></li>
      <li><a href="#sec6-3">High-Risk Segments</a></li>
    </ul>
  </li>
  <li><a href="#sec7">Getting Started</a></li>
  <li><a href="#sec8">Visual Analytics</a></li>
  <li><a href="#sec9">Data Dictionary</a></li>
  <li><a href="#sec10">Methodology</a></li>
  <li><a href="#sec11">Strategic Recommendations</a></li>
  <li><a href="#sec12">Contributing</a></li>
  <li><a href="#sec13">License</a></li>
</ol>

<hr>

<h2 id="sec1">1. Business Overview</h2>

<p>This end‑to‑end analytical solution empowers insurance stakeholders to measure <strong>processing efficiency</strong> and <strong>detect fraudulent patterns</strong> using synthetic data generated in R. It translates raw claims information into actionable business intelligence.</p>

<h3>1.1 Core Deliverables</h3>

<ul>
  <li>Full R analysis pipeline (<code>Main code.R</code>)</li>
  <li>Synthetic data generator (<code>Cargar los paquetes.txt</code>)</li>
  <li>Interactive and static visualizations</li>
  <li>Executive dashboard</li>
  <li>Fraud risk scoring engine</li>
  <li>Comprehensive data dictionary</li>
</ul>

<hr>

<h2 id="sec2">2. Key Benefits</h2>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Dimension</th>
    <th>Impact</th>
  </tr>
  <tr>
    <td>Operational Agility</td>
    <td>Uncovered 60‑day bottlenecks in Health claims, enabling process redesign</td>
  </tr>
  <tr>
    <td>Risk Mitigation</td>
    <td>Isolated concentrated fraud patterns, focusing investigative resources</td>
  </tr>
  <tr>
    <td>Predictive Clarity</td>
    <td>Validated severity as the primary driver of resolution time</td>
  </tr>
  <tr>
    <td>Benchmarking</td>
    <td>Established comparative standards across insurance products</td>
  </tr>
  <tr>
    <td>Early Warning</td>
    <td>Deployed a scoring system for proactive fraud detection</td>
  </tr>
</table>

<hr>

<h2 id="sec3">3. Project Objectives</h2>

<ol>
  <li>Quantify average resolution times for claims</li>
  <li>Identify anomalies and fraud indicators via statistical patterns</li>
  <li>Visualize critical performance metrics for decision‑making</li>
  <li>Define operational benchmarks per insurance type</li>
  <li>Implement a risk scoring framework</li>
  <li>Enable continuous monitoring capabilities</li>
</ol>

<hr>

<h2 id="sec4">4. Repository Layout</h2>

<pre>
insurance-claims-analysis/
│
├── data/
│   ├── policies.csv              # Policy master data
│   ├── clients.csv               # Client information
│   ├── claims.csv                # Claims transaction data
│   └── payments.csv              # Payment records
│
├── scripts/
│   ├── Datos.R                   # Synthetic data generation (R)
│   └── Main code.R               # Complete analysis pipeline
│
├── outputs/
│   ├── visuals/                  # Generated visualizations
│   │   ├── resolution_density_by_type.png
│   │   ├── resolution_boxplot_by_type.png
│   │   ├── resolution_by_severity_type.png
│   │   ├── monthly_resolution_trend.png
│   │   ├── top_20_suspicious_claims_heatmap.png
│   │   ├── fraud_score_by_severity.png
│   │   ├── client_resolution_efficiency.png
│   │   ├── claim_frequency_heatmap.png
│   │   └── claim_amount_heatmap.png
│   └── tables/
│       └── fraud_risk_executive_summary.html
│
├── .gitattributes
├── LICENSE
├── README.md
└── .gitignore
</pre>

<hr>

<h2 id="sec5">5. Technology Infrastructure</h2>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Component</th>
    <th>Technology</th>
    <th>Purpose</th>
  </tr>
  <tr>
    <td>Data Generation</td>
    <td>R</td>
    <td>Synthetic dataset creation</td>
  </tr>
  <tr>
    <td>Analysis</td>
    <td>R</td>
    <td>Statistical modeling</td>
  </tr>
  <tr>
    <td>Visualization</td>
    <td>ggplot2, plotly</td>
    <td>Interactive and static charts</td>
  </tr>
  <tr>
    <td>Reporting</td>
    <td>gt, htmltools</td>
    <td>Automated report generation</td>
  </tr>
  <tr>
    <td>Version Control</td>
    <td>Git, GitHub</td>
    <td>Code collaboration</td>
  </tr>
</table>

<h3>Required R Packages</h3>

<pre>
install.packages(c(
  "dplyr", "lubridate", "tidyverse", "ggplot2", "plotly",
  "knitr", "scales", "gt", "stringr", "htmltools"
))
</pre>

<hr>

<h2 id="sec6">6. Critical Insights</h2>

<h3 id="sec6-1">6.1 Time-to-Resolution Metrics</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Category</th>
    <th>Finding</th>
    <th>Strategic Implication</th>
  </tr>
  <tr>
    <td>Overall</td>
    <td>Mean: 38.3 days, Median: 35 days, SD: 19.5 days</td>
    <td>High variability indicates inconsistent processes</td>
  </tr>
  <tr>
    <td>Health Claims</td>
    <td>Highest median (60 days) for medium severity</td>
    <td>Critical bottleneck requiring workflow audit</td>
  </tr>
  <tr>
    <td>Life Claims</td>
    <td>Fastest resolution (25 days) for medium severity</td>
    <td>Benchmark for other segments</td>
  </tr>
  <tr>
    <td>Severity Impact</td>
    <td>Clear monotonic relationship: severity ↑ → time ↑</td>
    <td>Severity is a high‑importance predictor</td>
  </tr>
</table>

<h3 id="sec6-2">6.2 Fraud Indicators</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Indicator</th>
    <th>Detected Patterns</th>
    <th>Priority</th>
  </tr>
  <tr>
    <td>Client Concentration</td>
    <td>Client #12: 6 claims, 40% of high‑risk flags</td>
    <td>Critical</td>
  </tr>
  <tr>
    <td>Rapid Resolution</td>
    <td>1‑day closure detected</td>
    <td>High</td>
  </tr>
  <tr>
    <td>Severity Correlation</td>
    <td>70% of high‑risk claims are high severity</td>
    <td>Medium</td>
  </tr>
  <tr>
    <td>Portfolio Risk</td>
    <td>93% claims healthy baseline; 1 critical case</td>
    <td>Low</td>
  </tr>
</table>

<h3 id="sec6-3">6.3 High-Risk Segments</h3>

<ul>
  <li><strong>Young‑Life Segment</strong>: $297K exposure (200% above expected) – top investigation priority</li>
  <li><strong>Senior‑Health Segment</strong>: $211K exposure (250% above expected) – significant deviation</li>
  <li><strong>Age Gap Anomaly</strong>: No health claims under 41 despite high frequencies in older groups</li>
  <li><strong>Auto Claim Spike</strong>: 51‑60 age group shows concentrated activity</li>
  <li><strong>Life Claims Pattern</strong>: Only appears in 61‑80 age range</li>
</ul>

<hr>

<h2 id="sec7">7. Getting Started</h2>

<h3>7.1 Initial Setup</h3>

<ol>
  <li>Clone the repository:</li>
</ol>

<pre>
git clone https://github.com/yourusername/insurance-claims-analysis.git
cd insurance-claims-analysis
</pre>

<ol start="2">
  <li>Set working directory in R scripts:</li>
</ol>

<pre>
# Modify base_path in Main code.R to your local path
base_path <- "C:/Your/Path/To/Insurance"
</pre>

<h3>7.2 Generate Synthetic Data</h3>

<pre>
source("scripts/Cargar los paquetes.txt")
</pre>

<p>This creates four CSV files: <code>policies.csv</code>, <code>clients.csv</code>, <code>claims.csv</code>, and <code>payments.csv</code>.</p>

<h3>7.3 Run the Full Pipeline</h3>

<pre>
source("scripts/Main code.R")
</pre>

<p>The script automatically executes:</p>
<ul>
  <li>Initialization</li>
  <li>Data preprocessing</li>
  <li>Merging (creates <code>claims_full</code>)</li>
  <li>Descriptive analysis</li>
  <li>Resolution time analysis</li>
  <li>Visualization generation</li>
  <li>Anomaly detection</li>
  <li>Fraud scoring</li>
  <li>Executive summary</li>
</ul>

<hr>

<h2 id="sec8">8. Visual Analytics</h2>

<h3>8.1 Resolution Distribution</h3>

<p>Multi‑panel analysis reveals:</p>
<ul>
  <li>Health claims: widest spread and longest tail</li>
  <li>Auto claims: narrowest, most consistent window</li>
  <li>Severity as the clear driver</li>
  <li>Outlier concentration in high‑severity claims</li>
</ul>

<h3>8.2 Monthly Trend</h3>

<ul>
  <li>Cyclical patterns identified</li>
  <li>Peaks consistently exceeding the 35‑day benchmark</li>
  <li>Smoothed trend line indicates process health</li>
  <li>Early warning signals for proactive intervention</li>
</ul>

<h3>8.3 Fraud Risk Heatmap</h3>

<ul>
  <li>Client concentration patterns</li>
  <li>Score distribution by severity (low: ~21, medium: ~24, high: ~38)</li>
  <li>Priority targets highlighted</li>
  <li>Heteroscedasticity: variance increases with severity</li>
</ul>

<h3>8.4 Demographic Heatmaps</h3>

<ul>
  <li>Exposure hotspots by age and insurance type</li>
  <li>Statistical deviations from expected patterns</li>
  <li>Risk concentration visualisation</li>
</ul>

<hr>

<h2 id="sec9">9. Data Dictionary</h2>

<h3>9.1 Policies Table</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr><td>policy_id</td><td>int</td><td>Unique policy identifier</td></tr>
  <tr><td>type_insurance</td><td>string</td><td>Auto, Life, Health, Home</td></tr>
  <tr><td>modality</td><td>string</td><td>Monthly, Annual, Quarterly</td></tr>
  <tr><td>id_client</td><td>int</td><td>Foreign key to clients</td></tr>
  <tr><td>issue_date</td><td>date</td><td>Policy issue date</td></tr>
  <tr><td>start_date</td><td>date</td><td>Policy start date</td></tr>
  <tr><td>end_date</td><td>date</td><td>Policy end date</td></tr>
  <tr><td>policy_status</td><td>string</td><td>Active, Canceled, Expired, Suspended, Renewed</td></tr>
  <tr><td>premium_monthly</td><td>numeric</td><td>Monthly premium amount</td></tr>
  <tr><td>premium_annual</td><td>numeric</td><td>Annual premium amount</td></tr>
  <tr><td>insured_amount</td><td>numeric</td><td>Total insured value</td></tr>
  <tr><td>deductible</td><td>numeric</td><td>Deductible amount</td></tr>
</table>

<h3>9.2 Claims Table</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr><td>id_claim</td><td>int</td><td>Unique claim identifier</td></tr>
  <tr><td>id_client</td><td>int</td><td>Foreign key to clients</td></tr>
  <tr><td>id_policy</td><td>int</td><td>Foreign key to policies</td></tr>
  <tr><td>claim_date</td><td>date</td><td>Date of occurrence</td></tr>
  <tr><td>notification_date</td><td>date</td><td>Date reported</td></tr>
  <tr><td>closure_date</td><td>date</td><td>Date closed</td></tr>
  <tr><td>claim_type</td><td>string</td><td>Accident, Theft, Fire, Liability, Other</td></tr>
  <tr><td>severity</td><td>factor</td><td>Low, Medium, High</td></tr>
  <tr><td>claimed_amount</td><td>numeric</td><td>Amount claimed</td></tr>
  <tr><td>approved_amount</td><td>numeric</td><td>Amount approved</td></tr>
  <tr><td>paid_amount</td><td>numeric</td><td>Amount paid</td></tr>
  <tr><td>claim_status</td><td>string</td><td>Registered, In Process, Closed, Rejected, Under Investigation</td></tr>
  <tr><td>resolution_days</td><td>numeric</td><td>Days from claim to closure</td></tr>
</table>

<h3>9.3 Clients Table</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr><td>id_client</td><td>int</td><td>Unique client identifier</td></tr>
  <tr><td>gender</td><td>string</td><td>Male, Female, Other</td></tr>
  <tr><td>age_group</td><td>string</td><td>20-30, 31-40, 41-50, 51-60, 61-70, 71-80</td></tr>
  <tr><td>income_level</td><td>string</td><td>Low, Medium, High</td></tr>
  <tr><td>occupations</td><td>string</td><td>Professional, Technical, Worker, Retired, Unemployed, Other</td></tr>
</table>

<h3>9.4 Payments Table</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr><td>id_payment</td><td>int</td><td>Unique payment identifier</td></tr>
  <tr><td>id_policy</td><td>int</td><td>Foreign key to policies</td></tr>
  <tr><td>payment_date</td><td>date</td><td>Date of payment</td></tr>
  <tr><td>payment_amount</td><td>numeric</td><td>Payment amount</td></tr>
  <tr><td>payment_method</td><td>string</td><td>Debit, Card, Bank Transfer, Cash</td></tr>
  <tr><td>payment_status</td><td>string</td><td>Paid, Pending, Overdue, Rejected</td></tr>
  <tr><td>days_overdue</td><td>numeric</td><td>Days payment is overdue</td></tr>
</table>

<hr>

<h2 id="sec10">10. Methodology</h2>

<h3>10.1 Statistical Toolkit</h3>

<ul>
  <li><strong>Descriptives</strong>: Mean, median, SD for resolution times</li>
  <li><strong>Distributions</strong>: Density plots, boxplots by category</li>
  <li><strong>Time Series</strong>: Monthly trend with smoothing</li>
  <li><strong>Outlier Detection</strong>: IQR and percentile thresholds</li>
  <li><strong>Heteroscedasticity</strong>: Variance analysis across segments</li>
</ul>

<h3>10.2 Fraud Detection Protocol</h3>

<ol>
  <li><strong>Rapid Resolution</strong>: Claims closed <5 days (25 points)</li>
  <li><strong>High Frequency</strong>: >5 claims per client in 30 days (25 points)</li>
  <li><strong>Extreme Amounts</strong>: >95th percentile claimed (20 points)</li>
  <li><strong>Disparity</strong>: Claimed >80% of insured value (20 points)</li>
  <li><strong>Severity Flags</strong>: High severity claims (10 points)</li>
</ol>

<h3>10.3 Risk Scoring</h3>

<ul>
  <li><strong>Per indicator</strong>: 5‑25 points</li>
  <li><strong>Total score</strong>: 0‑100</li>
  <li><strong>Tiers</strong>:
    <ul>
      <li>Critical: >45</li>
      <li>High: 35‑44</li>
      <li>Medium: 25‑34</li>
      <li>Low: <25</li>
    </ul>
  </li>
</ul>

<hr>

<h2 id="sec11">11. Strategic Recommendations</h2>

<h3>11.1 Immediate Steps</h3>

<ol>
  <li><strong>Investigate Client #12</strong>: Account‑level review of 6 claims within 30 days</li>
  <li><strong>Audit Health Claims</strong>: Root‑cause analysis for 60‑day median</li>
  <li><strong>Implement Early Warning</strong>: Monitor when resolution times approach 35‑day threshold</li>
  <li><strong>Review High‑Severity Cases</strong>: Focus on Auto and Life outliers</li>
</ol>

<h3>11.2 Strategic Roadmap</h3>

<ol>
  <li><strong>Segment‑Based Workflows</strong>: Differentiate processes by severity</li>
  <li><strong>Predictive Modeling</strong>: Use severity as a key feature</li>
  <li><strong>Recurring Monitoring</strong>: Weekly review of resolution and fraud scores</li>
  <li><strong>Client‑Level Scoring</strong>: Aggregate fraud scores per client</li>
  <li><strong>Network Analysis</strong>: Identify connected fraud patterns</li>
</ol>

<hr>

<h2 id="sec12">12. Contributing</h2>

<p>Contributions are welcome! Follow these steps:</p>

<ol>
  <li>Fork the repository</li>
  <li>Create a feature branch (<code>git checkout -b feature/amazing-feature</code>)</li>
  <li>Commit changes (<code>git commit -m 'Add amazing feature'</code>)</li>
  <li>Push to branch (<code>git push origin feature/amazing-feature</code>)</li>
  <li>Open a Pull Request</li>
</ol>

<h3>Coding Standards</h3>

<ul>
  <li>Follow tidyverse style guide</li>
  <li>Document functions with roxygen2</li>
  <li>Add comments for complex logic</li>
  <li>Maintain consistent naming conventions</li>
</ul>

<hr>

<h2 id="sec13">13. License</h2>

<p>This project is licensed under the MIT License – see the LICENSE file for details.</p>

<hr>

<h2>Additional References</h2>

<ul>
  <li><a href="https://app.notion.com/p/Insurance-Claims-Analysis-Time-to-Resolution-Anomaly-Detection-3344e631f1158011a4c0ce07c2df4244">Full Analysis Documentation</a></li>
  <li><a href="https://r4ds.had.co.nz/">R for Data Science</a></li>
  <li><a href="https://ggplot2.tidyverse.org/">ggplot2 Documentation</a></li>
  <li><a href="https://www.kaggle.com/learn/intro-to-machine-learning">Anomaly Detection Techniques</a></li>
</ul>

<hr>

<h2>Contact & Support</h2>

<p>For questions, suggestions, or collaboration, please open an issue or contact the project maintainer.</p>

<hr>

<p><strong>Last Updated</strong>: August 2026<br>
<strong>Status</strong>: Completed – Ready for Review</p>
<hr>

  <sub>⭐ Star this repository if you find it useful!</sub>
</div>
