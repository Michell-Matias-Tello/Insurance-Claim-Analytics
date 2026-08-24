<h1 align="center">Insurance Claim Analytics Platform</h1> <h2 align="center">Operational Efficiency & Risk Detection Platform</h2><p align="center">

<p align="center">
  <img src="https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white" alt="R">
  <img src="https://img.shields.io/badge/Html-3776AB?style=for-the-badge&logo=html&logoColor=white" alt="Html">
  <img src="https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=RStudio&logoColor=white" alt="RStudio">
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" alt="Status">
</p>

<hr>

<h2>Executive Summary</h2>

<p>This platform delivers comprehensive insurance claims analytics focusing on <strong>processing efficiency</strong> and <strong>fraud pattern recognition</strong>. Using synthetic data generated with R, the solution provides actionable intelligence for claims operations optimization and risk management.</p>

<h3>Key Business Impact</h3>

<ul>
  <li><strong>Operational Efficiency</strong>: Identified resolution bottlenecks up to 60 days in Health-Medium claims</li>
  <li><strong>Risk Management</strong>: Detected concentrated fraud patterns in specific client segments</li>
  <li><strong>Data Strategy</strong>: Established severity as primary driver of resolution time</li>
  <li><strong>Performance Benchmarking</strong>: Created baselines across insurance product lines</li>
  <li><strong>Early Warning</strong>: Developed fraud scoring system for proactive detection</li>
</ul>

<hr>

<h2>Table of Contents</h2>

<ol>
  <li><a href="#overview">Project Overview</a></li>
  <li><a href="#objectives">Core Objectives</a></li>
  <li><a href="#structure">Repository Structure</a></li>
  <li><a href="#technology">Technology Stack</a></li>
  <li><a href="#findings">Key Findings</a></li>
  <li><a href="#setup">Getting Started</a></li>
  <li><a href="#visuals">Visualization Highlights</a></li>
  <li><a href="#dictionary">Data Dictionary</a></li>
  <li><a href="#methodology">Analytical Approach</a></li>
  <li><a href="#recommendations">Recommendations</a></li>
</ol>

<hr>

<h2 id="overview">1. Project Overview</h2>

<p>This project delivers an end-to-end analytical framework for insurance claims data, focusing on <strong>time to resolution</strong> and <strong>anomaly and fraud detection</strong>. Using synthetic data generated with R and analyzed in R Studio, the solution provides actionable insights for claims operations optimization and risk management.</p>

<h3>1.1 Key Deliverables</h3>

<ul>
  <li>Complete R analysis pipeline (Main code.R)</li>
  <li>Synthetic data generation script (Cargar los paquetes.txt)</li>
  <li>Interactive and static visualizations</li>
  <li>Executive summary dashboard</li>
  <li>Fraud risk scoring framework</li>
  <li>Comprehensive data documentation</li>
</ul>

<hr>

<h2 id="objectives">2. Core Objectives</h2>

<ol>
  <li>Measure average time to resolution for insurance claims</li>
  <li>Detect anomalies and fraud indicators using statistical patterns</li>
  <li>Visualize critical performance metrics for decision-making</li>
  <li>Establish operational benchmarks across insurance types</li>
  <li>Deploy risk scoring system for fraud identification</li>
  <li>Enable continuous monitoring capabilities</li>
</ol>

<hr>

<h2 id="structure">3. Repository Structure</h2>

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
│   ├── Cargar los paquetes.txt   # Synthetic data generation (R)
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
├── README.md
└── .gitignore
</pre>

<hr>

<h2 id="technology">4. Technology Stack</h2>

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
    <td>Data Analysis</td>
    <td>R</td>
    <td>Statistical analysis and modeling</td>
  </tr>
  <tr>
    <td>Visualization</td>
    <td>ggplot2, plotly</td>
    <td>Interactive and static visualizations</td>
  </tr>
  <tr>
    <td>Reporting</td>
    <td>gt, htmltools</td>
    <td>Automated report generation</td>
  </tr>
  <tr>
    <td>Version Control</td>
    <td>Git, GitHub</td>
    <td>Code repository and collaboration</td>
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

<h2 id="findings">5. Key Findings</h2>

<h3>5.1 Resolution Time Analysis</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Category</th>
    <th>Finding</th>
    <th>Business Implication</th>
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
    <td>Best practice benchmark for other segments</td>
  </tr>
  <tr>
    <td>Severity Impact</td>
    <td>Clear monotonic relationship: severity increases resolution time</td>
    <td>Severity is high-importance predictive feature</td>
  </tr>
</table>

<h3>5.2 Fraud Detection Results</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Indicator</th>
    <th>Detected Patterns</th>
    <th>Priority</th>
  </tr>
  <tr>
    <td>Client Concentration</td>
    <td>Client #12: 6 claims, 40% of high-risk flags</td>
    <td>Critical</td>
  </tr>
  <tr>
    <td>Rapid Resolution</td>
    <td>1-day claim closure detected</td>
    <td>High</td>
  </tr>
  <tr>
    <td>Severity Correlation</td>
    <td>70% of high-risk claims are high severity</td>
    <td>Medium</td>
  </tr>
  <tr>
    <td>Portfolio Risk</td>
    <td>93% claims healthy baseline; 1 critical case</td>
    <td>Low</td>
  </tr>
</table>

<h3>5.3 Demographic Risk Patterns</h3>

<ul>
  <li><strong>Young-Life Segment</strong>: $297K exposure (200% above expected) - Highest investigation priority</li>
  <li><strong>Senior-Health Segment</strong>: $211K exposure (250% above expected) - Significant deviation</li>
  <li><strong>Age Gap Anomaly</strong>: No health claims under age 41 despite high frequencies in older groups</li>
  <li><strong>Auto Claim Concentration</strong>: 51-60 age group shows concentrated claims</li>
  <li><strong>Life Claims Pattern</strong>: Only appears in 61-80 age range</li>
</ul>

<hr>

<h2 id="setup">6. Getting Started</h2>

<h3>6.1 Setup</h3>

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

<h3>6.2 Generate Synthetic Data</h3>

<pre>
source("scripts/Cargar los paquetes.txt")
</pre>

<p>This creates four CSV files: <code>policies.csv</code>, <code>clients.csv</code>, <code>claims.csv</code>, and <code>payments.csv</code>.</p>

<h3>6.3 Execute Analysis Pipeline</h3>

<pre>
source("scripts/Main code.R")
</pre>

<p>The script executes these sections automatically:</p>
<ul>
  <li>Setup and initialization</li>
  <li>Data preprocessing</li>
  <li>Data merging (creates <code>claims_full</code>)</li>
  <li>Descriptive analysis</li>
  <li>Resolution time analysis</li>
  <li>Visualization generation</li>
  <li>Anomaly detection</li>
  <li>Fraud scoring</li>
  <li>Executive summary</li>
</ul>

<hr>

<h2 id="visuals">7. Visualization Highlights</h2>

<h3>7.1 Resolution Time Distribution</h3>

<p>Multi-panel analysis by insurance type and severity:</p>
<ul>
  <li>Health claims: Widest spread and longest tail</li>
  <li>Auto claims: Narrowest, most consistent window</li>
  <li>Severity as clear resolution driver</li>
  <li>Outlier concentration in high-severity claims</li>
</ul>

<h3>7.2 Monthly Resolution Trend</h3>

<ul>
  <li>Cyclical performance patterns identified</li>
  <li>Peaks consistently exceeding 35-day benchmark</li>
  <li>Smoothed trend line reveals process health</li>
  <li>Early warning indicators for proactive intervention</li>
</ul>

<h3>7.3 Fraud Risk Analysis</h3>

<ul>
  <li>Client concentration patterns visible in heatmap</li>
  <li>Score distribution by severity (low: ~21, medium: ~24, high: ~38)</li>
  <li>Priority investigation targets identified</li>
  <li>Heteroscedasticity: variance increases with severity</li>
</ul>

<h3>7.4 Demographic Risk Heatmaps</h3>

<ul>
  <li>Age-insurance type exposure hotspots</li>
  <li>Statistical deviations from expected patterns</li>
  <li>Risk concentration visualization</li>
  <li>Priority investigation targets</li>
</ul>

<hr>

<h2 id="dictionary">8. Data Dictionary</h2>

<h3>8.1 Policies Table</h3>

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

<h3>8.2 Claims Table</h3>

<table border="1" cellpadding="5" cellspacing="0">
  <tr bgcolor="#f2f2f2">
    <th>Field</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr><td>id_claim</td><td>int</td><td>Unique claim identifier</td></tr>
  <tr><td>id_client</td><td>int</td><td>Foreign key to clients</td></tr>
  <tr><td>id_policy</td><td>int</td><td>Foreign key to policies</td></tr>
  <tr><td>claim_date</td><td>date</td><td>Date of claim occurrence</td></tr>
  <tr><td>notification_date</td><td>date</td><td>Date claim was reported</td></tr>
  <tr><td>closure_date</td><td>date</td><td>Date claim was closed</td></tr>
  <tr><td>claim_type</td><td>string</td><td>Accident, Theft, Fire, Liability, Other</td></tr>
  <tr><td>severity</td><td>factor</td><td>Low, Medium, High</td></tr>
  <tr><td>claimed_amount</td><td>numeric</td><td>Amount claimed</td></tr>
  <tr><td>approved_amount</td><td>numeric</td><td>Amount approved</td></tr>
  <tr><td>paid_amount</td><td>numeric</td><td>Amount paid</td></tr>
  <tr><td>claim_status</td><td>string</td><td>Registered, In Process, Closed, Rejected, Under Investigation</td></tr>
  <tr><td>resolution_days</td><td>numeric</td><td>Days from claim to closure</td></tr>
</table>

<h3>8.3 Clients Table</h3>

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

<h3>8.4 Payments Table</h3>

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

<h2 id="methodology">9. Analytical Approach</h2>

<h3>9.1 Statistical Methods</h3>

<ul>
  <li><strong>Descriptive Statistics</strong>: Mean, median, standard deviation for resolution times</li>
  <li><strong>Distribution Analysis</strong>: Density plots, boxplots by category</li>
  <li><strong>Time Series</strong>: Monthly trend analysis with smoothing</li>
  <li><strong>Outlier Detection</strong>: Statistical thresholds (IQR, percentiles)</li>
  <li><strong>Heteroscedasticity Analysis</strong>: Variance assessment across segments</li>
</ul>

<h3>9.2 Fraud Detection Framework</h3>

<ol>
  <li><strong>Rapid Resolution</strong>: Claims closed less than 5 days (25 points)</li>
  <li><strong>High Frequency</strong>: More than 5 claims per client in 30 days (25 points)</li>
  <li><strong>Extreme Amounts</strong>: Greater than 95th percentile claimed amount (20 points)</li>
  <li><strong>Amount Disparity</strong>: Claimed more than 80% of insured value (20 points)</li>
  <li><strong>Severity Flags</strong>: High severity claims (10 points)</li>
</ol>

<h3>9.3 Risk Scoring System</h3>

<ul>
  <li><strong>Each indicator</strong>: 5-25 points</li>
  <li><strong>Total risk score</strong>: 0-100</li>
  <li><strong>Priority levels</strong>:
    <ul>
      <li>Critical: Greater than 45</li>
      <li>High: 35-44</li>
      <li>Medium: 25-34</li>
      <li>Low: Less than 25</li>
    </ul>
  </li>
</ul>

<hr>

<h2 id="recommendations">10. Recommendations</h2>

<h3>10.1 Immediate Actions</h3>

<ol>
  <li><strong>Investigate Client #12</strong>: Account-level review of 6 claims within 30 days</li>
  <li><strong>Audit Health Claims Process</strong>: Root cause analysis for 60-day median resolution</li>
  <li><strong>Implement Early Warning System</strong>: Monitor when resolution times approach 35-day threshold</li>
  <li><strong>Review High-Severity Cases</strong>: Focus on Auto and Life high-severity outliers</li>
</ol>

<h3>10.2 Strategic Initiatives</h3>

<ol>
  <li><strong>Segment-Based Workflow</strong>: Differentiate processes by severity level</li>
  <li><strong>Predictive Modeling</strong>: Develop model using severity as key feature</li>
  <li><strong>Recurring Monitoring Framework</strong>: Weekly review of resolution time and fraud scores</li>
  <li><strong>Client-Level Risk Scoring</strong>: Aggregate fraud scores by client for comprehensive assessment</li>
  <li><strong>Network Analysis Integration</strong>: Identify connected fraud patterns across claims</li>
</ol>

<hr>

<h2>Contributing</h2>

<p>Contributions are welcome! Please follow these steps:</p>

<ol>
  <li>Fork the repository</li>
  <li>Create a feature branch (<code>git checkout -b feature/amazing-feature</code>)</li>
  <li>Commit changes (<code>git commit -m 'Add amazing feature'</code>)</li>
  <li>Push to branch (<code>git push origin feature/amazing-feature</code>)</li>
  <li>Open a Pull Request</li>
</ol>

<h3>Coding Standards</h3>

<ul>
  <li>Follow R style guide (tidyverse style)</li>
  <li>Document functions using roxygen2</li>
  <li>Include comments for complex logic</li>
  <li>Maintain consistent file naming conventions</li>
</ul>

<hr>

<h2>License</h2>

<p>This project is licensed under the MIT License - see the LICENSE file for details.</p>

<hr>

<h2>Resources</h2>

<ul>
  <li><a href="https://app.notion.com/p/Insurance-Claims-Analysis-Time-to-Resolution-Anomaly-Detection-3344e631f1158011a4c0ce07c2df4244">Complete Analysis Documentation</a></li>
  <li><a href="https://r4ds.had.co.nz/">R for Data Science</a></li>
  <li><a href="https://ggplot2.tidyverse.org/">ggplot2 Documentation</a></li>
  <li><a href="https://www.kaggle.com/learn/intro-to-machine-learning">Anomaly Detection Techniques</a></li>
</ul>

<hr>

<h2>Contact</h2>

<p>For questions, suggestions, or collaboration inquiries, please open an issue or contact the project maintainer.</p>

<hr>

<p><strong>Last Updated</strong>: August 2026<br>
<strong>Project Status</strong>: Completed - Ready for Review</p>

 

  <br>
  <sub>⭐ Star this repository if you find it useful!</sub>
</div>
