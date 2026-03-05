## 🔬 Fusion 360 Validation

To validate the MATLAB-based material selection results, the top-ranked materials were applied to an identical L-bracket model in Fusion 360. The **Inspect → Properties** tool was used to compare mass for each material.

### Mass Comparison

| Material | Mass (g) |
|---------|---------|
| CFRP | 238 |
| Titanium | 750 |
| Aluminum Alloy | 1231 |

### Fusion 360 Results

#### CFRP (Lowest Mass)
<img width="900" alt="CFRP" src="https://github.com/user-attachments/assets/c55e3658-1893-4e3a-bba7-bc3e4b2a8114" />

#### Titanium
<img width="900" alt="Titanium" src="https://github.com/user-attachments/assets/678fd28e-0a0b-47c7-9643-d5b062141222" />

#### Aluminum Alloy (Highest Mass)
<img width="900" alt="Aluminum-copper" src="https://github.com/user-attachments/assets/15d0d1a2-7855-4d48-b1a2-18b8d9248e7d" />

### Observation

The Fusion 360 results confirm the MATLAB ranking logic:

- Lower density materials produce lower component mass.
- CFRP resulted in the lightest bracket.
- Aluminum alloy produced the highest mass among the tested materials.

This validates the material selection approach used in the MATLAB tool.
