data=readtable('materials.xlsx');
data.Properties.VariableNames
required_strength=input('Enter minimum required Yield Strength (MPa): ');
disp('Enter weights (must sum to 1)')
w_strength=input('Weight for Strength: ');
w_density=input('Weight for Density: ');
w_cost=input('Weight for Cost: ');
if abs(w_strength+w_density+w_cost-1)>0.001
    error('Weights must sum to 1.')
end
safe=data.YieldStrength>=required_strength;
filtered=data(safe,:);
disp('Materials after safety filtering:')
disp(filtered(:,{'Materials','YieldStrength'}))
strength_n=filtered.YieldStrength ./ max(filtered.YieldStrength);
density_n=min(filtered.Density) ./ filtered.Density;
cost_n=min(filtered.CostIndex) ./ filtered.CostIndex;
score=w_strength*strength_n+w_density*density_n+w_cost*cost_n;
filtered.Score=score;
ranked=sortrows(filtered,'Score','descend');
disp('  ')
disp('Final Material Ranking:')
disp(ranked(:,{'Materials','Score'}))
figure
loglog(data.Density, data.YieldStrength, 'bo', 'MarkerFaceColor','b')
grid on
hold on
xlabel('Density (kg/m^3)')
ylabel('Yield Strength (MPa)')
title('Ashby Chart: Strength vs Density')
best_density=ranked.Density(1);
best_strength=ranked.YieldStrength(1);
loglog(best_density,best_strength,'ro','MarkerSize',10,'MarkerFaceColor','r')
text(best_density*1.05,best_strength*1.05,char(ranked.Materials(1)),'Color','r','FontWeight','bold')
hold off
best_material=ranked.Materials(1);
best_score=ranked.Score(1);
disp('  ')
disp(['Best Material Selected: ', char(best_material)])
disp(['Score: ', num2str(best_score)])
disp('  ')
disp('--- Sensitivity Analysis: Increasing Cost Importance ---')
cost_weights=[0.2,0.3,0.4,0.5];
for i=1:length(cost_weights)
    w_cost= cost_weights(i);
    w_strength=0.5-(w_cost-0.2)/2;
    w_density=1-w_strength-w_cost;
    new_score=w_strength*strength_n+w_density*density_n+w_cost*cost_n;
    filtered.NewScore=new_score;
    new_ranked=sortrows(filtered,'NewScore','descend');
    top_material=new_ranked.Materials(1);
    disp(['Cost Weight = ',num2str(w_cost),'--> Best Material: ', char(top_material)])
end