Automated Material Selection Tool (MATLAB)
Overview:
This project is a parametric material selection tool developed in MATLAB for conceptual mechanical design.
The tool selects the most suitable material for a lightweight mechanical bracket based on:

1. Minimum yield strength requirement
2. Strength-to-weight performance
3. Cost consideration

Material ranking is performed using normalized multi-criteria decision analysis, and results are visualized using an Ashby chart (Strength vs Density).

Problem Statement:
In early-stage mechanical design, engineers must select materials without complete manufacturing and cost data.
This tool automates the material selection process by:
   --> Filtering materials based on safety requirements
   --> Normalizing material properties to remove unit bias
   --> Applying weighted scoring
   --> Ranking materials
   --> Visualizing results
   --> Performing sensitivity analysis

Methodology:
1. Safety Filtering: Materials that do not meet the minimum required yield strength are eliminated.
2. Normalization: Properties are normalized so that different units do not bias the decision:
   --> Yield Strength → Maximized
   --> Density → Minimized
   --> Cost → Minimized
3. Weighted Scoring:
Score is computed as:
Score = w₁(Strength) + w₂(Density) + w₃(Cost)
Where,
w1+w2+w3=1
4. Ranking: Materials are ranked in descending order based on the computed score.
5. Visualization:
An Ashby chart (log-log scale) is generated:
   --> All materials plotted in blue
   --> Best material highlighted in red

Example Output:
   --> Filtered material list
   --> Ranked materials with scores
   --> Ashby chart with highlighted optimal material
Example result:
Best Material Selected: Titanium Ti-6Al-4V
Score: 0.72835

Assumptions:
   --> Static loading conditions
   --> Room temperature operation
   --> Isotropic material behavior
   --> Relative cost index used instead of region-specific pricing

How to Run:
1. Place 'materials.xlsx' in the same folder as the script
2. Open MATLAB
3. Run 'material_tool_selection'.
4. Enter:
   --> Minimum required Yield Strength (MPa)
   --> Weight for Strength
   --> Weight for Density
   --> Weight for Cost

Engineering Insights:
   --> Lightweight composites dominate when cost weight is low
   --> Aluminum alloys provide balanced performance
   --> Steel performance decreases due to density penalty
   --> Sensitivity analysis shows material selection depends on design priorities

Skills Demonstrated:
   --> MATLAB programming
   --> Multi-criteria decision analysis
   --> Engineering optimization
   --> Data normalization
   --> Visualization (Ashby charts)
   --> Parametric design tools
   
Future Improvements:
   --> GUI interface
   --> Fatigue and temperature-based material selection
   --> Real-time cost database integration
   --> Automated PDF report generation

Author:
Pranav Rao
VIT Vellore
