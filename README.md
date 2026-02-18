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
   1. Filtering materials based on safety requirements
   2. Normalizing material properties to remove unit bias
   3. Applying weighted scoring
   4. Ranking materials
   5. Visualizing results
   6. Performing sensitivity analysis

Methodology:
1. Safety Filtering: Materials that do not meet the minimum required yield strength are eliminated.
2. Normalization: Properties are normalized so that different units do not bias the decision:
   1. Yield Strength → Maximized
   2. Density → Minimized
   3. Cost → Minimized
3. Weighted Scoring:
Score is computed as:
Score = w₁(Strength) + w₂(Density) + w₃(Cost)
Where,
w1+w2+w3=1
4. Ranking: Materials are ranked in descending order based on the computed score.
5. Visualization:
An Ashby chart (log-log scale) is generated:
   1. All materials plotted in blue
   2. Best material highlighted in red

Example Output:
   1. Filtered material list
   2. Ranked materials with scores
   3. Ashby chart with highlighted optimal material
Example result:
Best Material Selected: Titanium Ti-6Al-4V
Score: 0.72835

Assumptions:
   1. Static loading conditions
   2. Room temperature operation
   3. Isotropic material behavior
   4. Relative cost index used instead of region-specific pricing

How to Run:
1. Place 'materials.xlsx' in the same folder as the script
2. Open MATLAB
3. Run 'material_tool_selection'.
4. Enter:
   1. Minimum required Yield Strength (MPa)
   2. Weight for Strength
   3. Weight for Density
   4. Weight for Cost

Engineering Insights:
   1. Lightweight composites dominate when cost weight is low
   2. Aluminum alloys provide balanced performance
   3. Steel performance decreases due to density penalty
   4. Sensitivity analysis shows material selection depends on design priorities

Skills Demonstrated:
   1. MATLAB programming
   2. Multi-criteria decision analysis
   3. Engineering optimization
   4. Data normalization
   5. Visualization (Ashby charts)
   6. Parametric design tools
   
Future Improvements:
   1. GUI interface
   2. Fatigue and temperature-based material selection
   3. Real-time cost database integration
   4. Automated PDF report generation

Author:
Pranav Rao
VIT Vellore
