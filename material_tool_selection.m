%% 1. Load Material Data
% Read material database from Excel file
data=readtable('materials.xlsx');

%% 2. User Input
% Take minimum required yield strength from user.
data.Properties.VariableNames
required_strength=input('Enter minimum required Yield Strength (MPa): ');

% Take weights for decision criteria
disp('Enter weights (must sum to 1)')
w_strength=input('Weight for Strength: ');
w_density=input('Weight for Density: ');
w_cost=input('Weight for Cost: ');

% Check if weights sum to 1
if abs(w_strength+w_density+w_cost-1)>0.001
    error('Weights must sum to 1.')
end

%% 3. Safety Filtering
% Remove materials that do not satisfy strength requirement
safe=data.YieldStrength>=required_strength;
filtered=data(safe,:);

% Stop program if no materials pass filter
if isempty(filtered)
    error('No materials meet the strength required.')
end

%% 4. Normalization
% Display materials after filtering
disp('Materials after safety filtering:')
disp(filtered(:,{'Materials','YieldStrength'}))

% Normalize properties to remove unit bias
% Strength → higher is better
strength_n=filtered.YieldStrength ./ max(filtered.YieldStrength);

% Density → lower is better
density_n=min(filtered.Density) ./ filtered.Density;

% Cost → lower is better
cost_n=min(filtered.CostIndex) ./ filtered.CostIndex;

%% 5. Weighted Scoring
% Compute final score using weighted sum method
score=w_strength*strength_n+w_density*density_n+w_cost*cost_n;

% Store scores in table
filtered.Score=score;

%% 6. Ranking Materials
% Sort materials based on descending score
ranked=sortrows(filtered,'Score','descend');
disp('  ')
disp('Final Material Ranking:')
disp(ranked(:,{'Materials','Score'}))

%% 7. Ashby Chart Visualization
% Plot all materials on log-log scale
figure
loglog(data.Density, data.YieldStrength, 'bo', 'MarkerFaceColor','b')
grid on
hold on
xlabel('Density (kg/m^3)')
ylabel('Yield Strength (MPa)')
title('Ashby Chart: Strength vs Density')

% Highlight best material in red
best_density=ranked.Density(1);
best_strength=ranked.YieldStrength(1);
loglog(best_density,best_strength,'ro','MarkerSize',10,'MarkerFaceColor','r')

% Add label to best material
text(best_density*1.05,best_strength*1.05,char(ranked.Materials(1)),'Color','r','FontWeight','bold')
hold off

%% 8. Display Best Material
best_material=ranked.Materials(1);
best_score=ranked.Score(1);
disp('  ')
disp(['Best Material Selected: ', char(best_material)])
disp(['Score: ', num2str(best_score)])

%% 9. Sensitivity Analysis
% Study effect of increasing cost importance
disp('  ')
disp('--- Sensitivity Analysis: Increasing Cost Importance ---')
cost_weights=[0.2,0.3,0.4,0.5];
for i=1:length(cost_weights)

    % Update cost weight
    w_cost= cost_weights(i);

    % Adjust other weights proportionally
    w_strength=0.5-(w_cost-0.2)/2;
    w_density=1-w_strength-w_cost;

    % Recalculate score
    new_score=w_strength*strength_n+w_density*density_n+w_cost*cost_n;
    filtered.NewScore=new_score;

    % Rank again
    new_ranked=sortrows(filtered,'NewScore','descend');

    % Display best material for each case
    top_material=new_ranked.Materials(1);
    disp(['Cost Weight = ',num2str(w_cost),'--> Best Material: ', char(top_material)])
end
