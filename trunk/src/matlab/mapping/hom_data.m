clc; clear; close all;
% Generating Cycles
% 1 ([8]->[0]) + 1 ([7]->[0]) + 1 ([0]->[0]) + 1 ([1]->[0]) + 1 ([4]->[0]) + 1 ([9]->[0]) + 1 ([5]->[0]) + 1 ([3]->[0]) + 1 ([2]->[0]) + 1 ([6]->[0])
% 1 ([8,9]->[4,5]) + 1 ([8,9]->[8,9]) + 1 ([8,9]->[5,6]) + 1 ([8,9]->[2,3]) + 1 ([8,9]->[3,4]) + 1 ([8,9]->[7,8]) + 1 ([8,9]->[0,1]) + 1 ([8,9]->[1,2]) + 1 ([8,9]->[6,7]) + -1 ([8,9]->[0,9])
% Cycle Sum
% 1 ([8,9]->[4,5]) + 1 ([8,9]->[8,9]) + 1 ([8,9]->[2,3]) + 1 ([8,9]->[7,8]) + 1 ([0]->[0]) + 1 ([1]->[0]) + 1 ([2]->[0]) + 1 ([8,9]->[5,6]) + 1 ([8,9]->[3,4]) + 1 ([8]->[0]) + 1 ([7]->[0]) + 1 ([8,9]->[0,1]) + 1 ([8,9]->[1,2]) + 1 ([8,9]->[6,7]) + 1 ([4]->[0]) + 1 ([9]->[0]) + 1 ([5]->[0]) + 1 ([3]->[0]) + 1 ([6]->[0]) + -1 ([8,9]->[0,9])
% Homotopies
% 1 ([8,9]->[0,1]) + -1 ([9]->[0]) + 1 ([9]->[1]) + 1 ([0,9]->[0,1])
% 1 ([9]->[9]) + 1 ([0,9]->[0,9]) + -1 ([9]->[0]) + 1 ([8,9]->[0,9])
% 1 ([9]->[2]) + 1 ([0,9]->[1,2]) + 1 ([8,9]->[1,2]) + -1 ([9]->[1])
% -1 ([9]->[2]) + 1 ([8,9]->[2,3]) + 1 ([9]->[3]) + 1 ([0,9]->[2,3])
% 1 ([9]->[4]) + 1 ([8,9]->[3,4]) + -1 ([9]->[3]) + 1 ([0,9]->[3,4])
% 1 ([8,9]->[4,5]) + 1 ([0,9]->[4,5]) + 1 ([9]->[5]) + -1 ([9]->[4])
% -1 ([9]->[5]) + 1 ([8,9]->[5,6]) + 1 ([0,9]->[5,6]) + 1 ([9]->[6])
% -1 ([9]->[6]) + 1 ([8,9]->[6,7]) + 1 ([9]->[7]) + 1 ([0,9]->[6,7])
% 1 ([8,9]->[7,8]) + -1 ([9]->[7]) + 1 ([9]->[8]) + 1 ([0,9]->[7,8])
% 1 ([8,9]->[8,9]) + 1 ([9]->[9]) + 1 ([0,9]->[8,9]) + -1 ([9]->[8])
% -1 ([8]->[0]) + 1 ([8]->[1]) + 1 ([7,8]->[0,1]) + -1 ([8,9]->[0,1])
% 1 ([7,8]->[0,9]) + -1 ([8]->[0]) + 1 ([8]->[9]) + -1 ([8,9]->[0,9])
% -1 ([8]->[1]) + -1 ([8,9]->[1,2]) + 1 ([7,8]->[1,2]) + 1 ([8]->[2])
% -1 ([8,9]->[2,3]) + 1 ([8]->[3]) + 1 ([7,8]->[2,3]) + -1 ([8]->[2])
% 1 ([8]->[4]) + 1 ([7,8]->[3,4]) + -1 ([8,9]->[3,4]) + -1 ([8]->[3])
% -1 ([8]->[4]) + -1 ([8,9]->[4,5]) + 1 ([7,8]->[4,5]) + 1 ([8]->[5])
% -1 ([8,9]->[5,6]) + -1 ([8]->[5]) + 1 ([8]->[6]) + 1 ([7,8]->[5,6])
% 1 ([7,8]->[6,7]) + -1 ([8,9]->[6,7]) + 1 ([8]->[7]) + -1 ([8]->[6])
% 1 ([7,8]->[7,8]) + -1 ([8,9]->[7,8]) + -1 ([8]->[7]) + 1 ([8]->[8])
% -1 ([8,9]->[8,9]) + 1 ([7,8]->[8,9]) + -1 ([8]->[8]) + 1 ([8]->[9])
% -1 ([7,8]->[0,1]) + -1 ([7]->[0]) + 1 ([6,7]->[0,1]) + 1 ([7]->[1])
% 1 ([7]->[9]) + -1 ([7,8]->[0,9]) + -1 ([7]->[0]) + 1 ([6,7]->[0,9])
% 1 ([6,7]->[1,2]) + 1 ([7]->[2]) + -1 ([7,8]->[1,2]) + -1 ([7]->[1])
% -1 ([7,8]->[2,3]) + -1 ([7]->[2]) + 1 ([6,7]->[2,3]) + 1 ([7]->[3])
% -1 ([7,8]->[3,4]) + 1 ([7]->[4]) + 1 ([6,7]->[3,4]) + -1 ([7]->[3])
% 1 ([6,7]->[4,5]) + -1 ([7]->[4]) + -1 ([7,8]->[4,5]) + 1 ([7]->[5])
% 1 ([6,7]->[5,6]) + -1 ([7]->[5]) + -1 ([7,8]->[5,6]) + 1 ([7]->[6])
% -1 ([7,8]->[6,7]) + 1 ([6,7]->[6,7]) + 1 ([7]->[7]) + -1 ([7]->[6])
% 1 ([6,7]->[7,8]) + -1 ([7,8]->[7,8]) + 1 ([7]->[8]) + -1 ([7]->[7])
% 1 ([7]->[9]) + -1 ([7,8]->[8,9]) + -1 ([7]->[8]) + 1 ([6,7]->[8,9])
% 1 ([5,6]->[0,1]) + -1 ([6,7]->[0,1]) + -1 ([6]->[0]) + 1 ([6]->[1])
% 1 ([5,6]->[0,9]) + 1 ([6]->[9]) + -1 ([6,7]->[0,9]) + -1 ([6]->[0])
% 1 ([5,6]->[1,2]) + -1 ([6,7]->[1,2]) + 1 ([6]->[2]) + -1 ([6]->[1])
% 1 ([6]->[3]) + -1 ([6]->[2]) + 1 ([5,6]->[2,3]) + -1 ([6,7]->[2,3])
% -1 ([6]->[3]) + 1 ([6]->[4]) + -1 ([6,7]->[3,4]) + 1 ([5,6]->[3,4])
% -1 ([6]->[4]) + -1 ([6,7]->[4,5]) + 1 ([6]->[5]) + 1 ([5,6]->[4,5])
% 1 ([5,6]->[5,6]) + -1 ([6,7]->[5,6]) + 1 ([6]->[6]) + -1 ([6]->[5])
% -1 ([6,7]->[6,7]) + 1 ([6]->[7]) + 1 ([5,6]->[6,7]) + -1 ([6]->[6])
% -1 ([6,7]->[7,8]) + -1 ([6]->[7]) + 1 ([5,6]->[7,8]) + 1 ([6]->[8])
% 1 ([5,6]->[8,9]) + -1 ([6]->[8]) + 1 ([6]->[9]) + -1 ([6,7]->[8,9])
% -1 ([5,6]->[0,1]) + 1 ([4,5]->[0,1]) + 1 ([5]->[1]) + -1 ([5]->[0])
% -1 ([5,6]->[0,9]) + 1 ([4,5]->[0,9]) + -1 ([5]->[0]) + 1 ([5]->[9])
% -1 ([5,6]->[1,2]) + 1 ([5]->[2]) + -1 ([5]->[1]) + 1 ([4,5]->[1,2])
% 1 ([5]->[3]) + 1 ([4,5]->[2,3]) + -1 ([5]->[2]) + -1 ([5,6]->[2,3])
% -1 ([5]->[3]) + 1 ([4,5]->[3,4]) + 1 ([5]->[4]) + -1 ([5,6]->[3,4])
% 1 ([4,5]->[4,5]) + -1 ([5]->[4]) + 1 ([5]->[5]) + -1 ([5,6]->[4,5])
% -1 ([5,6]->[5,6]) + 1 ([5]->[6]) + -1 ([5]->[5]) + 1 ([4,5]->[5,6])
% -1 ([5]->[6]) + 1 ([5]->[7]) + -1 ([5,6]->[6,7]) + 1 ([4,5]->[6,7])
% -1 ([5,6]->[7,8]) + -1 ([5]->[7]) + 1 ([5]->[8]) + 1 ([4,5]->[7,8])
% -1 ([5,6]->[8,9]) + 1 ([4,5]->[8,9]) + -1 ([5]->[8]) + 1 ([5]->[9])
% 1 ([3,4]->[0,1]) + -1 ([4,5]->[0,1]) + -1 ([4]->[0]) + 1 ([4]->[1])
% 1 ([4]->[9]) + -1 ([4,5]->[0,9]) + 1 ([3,4]->[0,9]) + -1 ([4]->[0])
% 1 ([3,4]->[1,2]) + 1 ([4]->[2]) + -1 ([4]->[1]) + -1 ([4,5]->[1,2])
% -1 ([4,5]->[2,3]) + -1 ([4]->[2]) + 1 ([4]->[3]) + 1 ([3,4]->[2,3])
% 1 ([4]->[4]) + 1 ([3,4]->[3,4]) + -1 ([4,5]->[3,4]) + -1 ([4]->[3])
% -1 ([4]->[4]) + -1 ([4,5]->[4,5]) + 1 ([4]->[5]) + 1 ([3,4]->[4,5])
% 1 ([3,4]->[5,6]) + 1 ([4]->[6]) + -1 ([4]->[5]) + -1 ([4,5]->[5,6])
% 1 ([4]->[7]) + -1 ([4]->[6]) + 1 ([3,4]->[6,7]) + -1 ([4,5]->[6,7])
% -1 ([4]->[7]) + 1 ([4]->[8]) + 1 ([3,4]->[7,8]) + -1 ([4,5]->[7,8])
% -1 ([4]->[8]) + 1 ([4]->[9]) + -1 ([4,5]->[8,9]) + 1 ([3,4]->[8,9])
% 1 ([3]->[1]) + -1 ([3,4]->[0,1]) + 1 ([2,3]->[0,1]) + -1 ([3]->[0])
% 1 ([2,3]->[0,9]) + 1 ([3]->[9]) + -1 ([3,4]->[0,9]) + -1 ([3]->[0])
% -1 ([3,4]->[1,2]) + -1 ([3]->[1]) + 1 ([3]->[2]) + 1 ([2,3]->[1,2])
% -1 ([3]->[2]) + 1 ([3]->[3]) + -1 ([3,4]->[2,3]) + 1 ([2,3]->[2,3])
% 1 ([2,3]->[3,4]) + 1 ([3]->[4]) + -1 ([3,4]->[3,4]) + -1 ([3]->[3])
% -1 ([3]->[4]) + 1 ([2,3]->[4,5]) + -1 ([3,4]->[4,5]) + 1 ([3]->[5])
% 1 ([3]->[6]) + -1 ([3,4]->[5,6]) + -1 ([3]->[5]) + 1 ([2,3]->[5,6])
% -1 ([3]->[6]) + -1 ([3,4]->[6,7]) + 1 ([3]->[7]) + 1 ([2,3]->[6,7])
% 1 ([3]->[8]) + -1 ([3,4]->[7,8]) + -1 ([3]->[7]) + 1 ([2,3]->[7,8])
% -1 ([3]->[8]) + 1 ([3]->[9]) + 1 ([2,3]->[8,9]) + -1 ([3,4]->[8,9])
% 1 ([2]->[1]) + 1 ([1,2]->[0,1]) + -1 ([2,3]->[0,1]) + -1 ([2]->[0])
% 1 ([2]->[9]) + -1 ([2,3]->[0,9]) + -1 ([2]->[0]) + 1 ([1,2]->[0,9])
% 1 ([1,2]->[1,2]) + -1 ([2]->[1]) + 1 ([2]->[2]) + -1 ([2,3]->[1,2])
% -1 ([2]->[2]) + 1 ([2]->[3]) + -1 ([2,3]->[2,3]) + 1 ([1,2]->[2,3])
% 1 ([1,2]->[3,4]) + -1 ([2,3]->[3,4]) + -1 ([2]->[3]) + 1 ([2]->[4])
% 1 ([1,2]->[4,5]) + -1 ([2,3]->[4,5]) + 1 ([2]->[5]) + -1 ([2]->[4])
% 1 ([2]->[6]) + -1 ([2]->[5]) + -1 ([2,3]->[5,6]) + 1 ([1,2]->[5,6])
% 1 ([1,2]->[6,7]) + 1 ([2]->[7]) + -1 ([2]->[6]) + -1 ([2,3]->[6,7])
% -1 ([2]->[7]) + 1 ([1,2]->[7,8]) + 1 ([2]->[8]) + -1 ([2,3]->[7,8])
% 1 ([2]->[9]) + -1 ([2]->[8]) + -1 ([2,3]->[8,9]) + 1 ([1,2]->[8,9])
% -1 ([1,2]->[0,1]) + -1 ([1]->[0]) + 1 ([1]->[1]) + 1 ([0,1]->[0,1])
% -1 ([1]->[0]) + -1 ([1,2]->[0,9]) + 1 ([1]->[9]) + 1 ([0,1]->[0,9])
% -1 ([1,2]->[1,2]) + 1 ([1]->[2]) + -1 ([1]->[1]) + 1 ([0,1]->[1,2])
% -1 ([1]->[2]) + 1 ([1]->[3]) + 1 ([0,1]->[2,3]) + -1 ([1,2]->[2,3])
% -1 ([1,2]->[3,4]) + 1 ([0,1]->[3,4]) + -1 ([1]->[3]) + 1 ([1]->[4])
% 1 ([0,1]->[4,5]) + -1 ([1,2]->[4,5]) + 1 ([1]->[5]) + -1 ([1]->[4])
% 1 ([1]->[6]) + -1 ([1]->[5]) + 1 ([0,1]->[5,6]) + -1 ([1,2]->[5,6])
% -1 ([1]->[6]) + -1 ([1,2]->[6,7]) + 1 ([1]->[7]) + 1 ([0,1]->[6,7])
% -1 ([1,2]->[7,8]) + 1 ([1]->[8]) + -1 ([1]->[7]) + 1 ([0,1]->[7,8])
% 1 ([0,1]->[8,9]) + -1 ([1]->[8]) + -1 ([1,2]->[8,9]) + 1 ([1]->[9])
% -1 ([0]->[0]) + 1 ([0]->[1]) + -1 ([0,1]->[0,1]) + -1 ([0,9]->[0,1])
% 1 ([0]->[9]) + -1 ([0]->[0]) + -1 ([0,9]->[0,9]) + -1 ([0,1]->[0,9])
% -1 ([0,9]->[1,2]) + -1 ([0]->[1]) + 1 ([0]->[2]) + -1 ([0,1]->[1,2])
% 1 ([0]->[3]) + -1 ([0]->[2]) + -1 ([0,1]->[2,3]) + -1 ([0,9]->[2,3])
% -1 ([0,1]->[3,4]) + -1 ([0,9]->[3,4]) + -1 ([0]->[3]) + 1 ([0]->[4])
% -1 ([0,9]->[4,5]) + -1 ([0,1]->[4,5]) + -1 ([0]->[4]) + 1 ([0]->[5])
% 1 ([0]->[6]) + -1 ([0,9]->[5,6]) + -1 ([0,1]->[5,6]) + -1 ([0]->[5])
% 1 ([0]->[7]) + -1 ([0]->[6]) + -1 ([0,1]->[6,7]) + -1 ([0,9]->[6,7])
% -1 ([0]->[7]) + -1 ([0,1]->[7,8]) + 1 ([0]->[8]) + -1 ([0,9]->[7,8])
% -1 ([0,1]->[8,9]) + 1 ([0]->[9]) + -1 ([0,9]->[8,9]) + -1 ([0]->[8])
% Domain Basis
% 0: [0]
% 1: [1]
% 2: [2]
% 3: [3]
% 4: [4]
% 5: [5]
% 6: [6]
% 7: [7]
% 8: [8]
% 9: [9]
% 10: [0,1]
% 11: [0,9]
% 12: [1,2]
% 13: [2,3]
% 14: [3,4]
% 15: [4,5]
% 16: [5,6]
% 17: [6,7]
% 18: [7,8]
% 19: [8,9]
% Codomain Basis
% 0: [0]
% 1: [1]
% 2: [2]
% 3: [3]
% 4: [4]
% 5: [5]
% 6: [6]
% 7: [7]
% 8: [8]
% 9: [9]
% 10: [0,1]
% 11: [0,9]
% 12: [1,2]
% 13: [2,3]
% 14: [3,4]
% 15: [4,5]
% 16: [5,6]
% 17: [6,7]
% 18: [7,8]
% 19: [8,9]
domain_dimension = 20;
codomain_dimension = 20;
homotopies_dimension = 100;
domain_vertices = 10;
codomain_vertices = 10;
tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
tmp_j = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20];
tmp_s = [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, -1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0];
cycle_sum = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

homotopies = cell(homotopies_dimension, 1);
tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 1} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 2} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 3} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 4} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 5} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 6} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 7} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 8} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 9} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [10, 10, 12, 20];
tmp_s = [-1.0, 1.0, 1.0, 1.0];
homotopies{ 10} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 11} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 12} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 13} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 14} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 15} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 16} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 17} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 18} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 19} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [9, 9, 19, 20];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 20} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 21} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 22} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 23} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 24} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 25} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 26} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 27} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 28} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 29} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [8, 8, 18, 19];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 30} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 31} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 32} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 33} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 34} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 35} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 36} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 37} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 38} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 39} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [7, 7, 17, 18];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 40} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 41} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 42} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 43} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 44} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 45} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 46} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 47} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 48} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 49} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [6, 6, 16, 17];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 50} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 51} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 52} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 53} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 54} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 55} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 56} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 57} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 58} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 59} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [5, 5, 15, 16];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 60} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 61} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 62} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 63} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 64} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 65} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 66} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 67} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 68} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 69} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [4, 4, 14, 15];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 70} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 71} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 72} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 73} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 74} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 75} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 76} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 77} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 78} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 79} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [3, 3, 13, 14];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 80} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 81} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 82} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 83} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 84} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 85} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 86} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 87} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 88} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 89} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [2, 2, 11, 13];
tmp_s = [-1.0, 1.0, 1.0, -1.0];
homotopies{ 90} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 2, 11, 11];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 91} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [1, 10, 12, 12];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 92} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [2, 3, 13, 13];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 93} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [3, 4, 14, 14];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 94} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [4, 5, 15, 15];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 95} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [5, 6, 16, 16];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 96} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [6, 7, 17, 17];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 97} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [7, 8, 18, 18];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 98} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [8, 9, 19, 19];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 99} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

tmp_m = 20;
tmp_n = 20;
tmp_i = [9, 10, 20, 20];
tmp_j = [1, 1, 11, 12];
tmp_s = [-1.0, 1.0, -1.0, -1.0];
homotopies{ 100} = sparse(tmp_i, tmp_j, tmp_s, tmp_m, tmp_n);

domain_aw_maps = sparse(domain_dimension^2, domain_dimension);
codomain_aw_maps = sparse(codomain_dimension^2, codomain_dimension);
domain_aw_maps(1, 1) = 1;
domain_aw_maps(22, 2) = 1;
domain_aw_maps(43, 3) = 1;
domain_aw_maps(64, 4) = 1;
domain_aw_maps(85, 5) = 1;
domain_aw_maps(106, 6) = 1;
domain_aw_maps(127, 7) = 1;
domain_aw_maps(148, 8) = 1;
domain_aw_maps(169, 9) = 1;
domain_aw_maps(190, 10) = 1;
domain_aw_maps(11, 11) = 1;
domain_aw_maps(202, 11) = 1;
domain_aw_maps(12, 12) = 1;
domain_aw_maps(230, 12) = 1;
domain_aw_maps(243, 13) = 1;
domain_aw_maps(33, 13) = 1;
domain_aw_maps(264, 14) = 1;
domain_aw_maps(54, 14) = 1;
domain_aw_maps(285, 15) = 1;
domain_aw_maps(75, 15) = 1;
domain_aw_maps(96, 16) = 1;
domain_aw_maps(306, 16) = 1;
domain_aw_maps(117, 17) = 1;
domain_aw_maps(327, 17) = 1;
domain_aw_maps(348, 18) = 1;
domain_aw_maps(138, 18) = 1;
domain_aw_maps(159, 19) = 1;
domain_aw_maps(369, 19) = 1;
domain_aw_maps(390, 20) = 1;
domain_aw_maps(180, 20) = 1;
codomain_aw_maps(1, 1) = 1;
codomain_aw_maps(22, 2) = 1;
codomain_aw_maps(43, 3) = 1;
codomain_aw_maps(64, 4) = 1;
codomain_aw_maps(85, 5) = 1;
codomain_aw_maps(106, 6) = 1;
codomain_aw_maps(127, 7) = 1;
codomain_aw_maps(148, 8) = 1;
codomain_aw_maps(169, 9) = 1;
codomain_aw_maps(190, 10) = 1;
codomain_aw_maps(11, 11) = 1;
codomain_aw_maps(202, 11) = 1;
codomain_aw_maps(12, 12) = 1;
codomain_aw_maps(230, 12) = 1;
codomain_aw_maps(243, 13) = 1;
codomain_aw_maps(33, 13) = 1;
codomain_aw_maps(264, 14) = 1;
codomain_aw_maps(54, 14) = 1;
codomain_aw_maps(285, 15) = 1;
codomain_aw_maps(75, 15) = 1;
codomain_aw_maps(96, 16) = 1;
codomain_aw_maps(306, 16) = 1;
codomain_aw_maps(117, 17) = 1;
codomain_aw_maps(327, 17) = 1;
codomain_aw_maps(348, 18) = 1;
codomain_aw_maps(138, 18) = 1;
codomain_aw_maps(159, 19) = 1;
codomain_aw_maps(369, 19) = 1;
codomain_aw_maps(390, 20) = 1;
codomain_aw_maps(180, 20) = 1;
