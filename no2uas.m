syms p q

row1=[20.91698, 39.26706, 41.88850, 46.47602];
x1=[1, 3, 4, 5];

row2=[0, 46.25330, 46.28914];
x2=[1, 4, 5];

row3=[63.86748, 64.01668, 90.88644, 98.09540];
x3=[1,3,4,5];

fprintf("\nMencari A, dengan interpolasi newton\n");
res= [];
for i=1:3
    res(end+1)=(row1(i+1)-row1(i))/(x1(i+1)-x1(i));
end
for i=1:2
    res(end+1)=(res(i+1)-res(i))/(x1(i+2)-x1(i));
end
res(end+1)=(res(end) - res(end-1))/(x1(end)-x1(1));
fprintf("\nDidapat persamaan:\n")
eq = row1(1) + res(1)*(p-x1(1)) + res(4)*(p-x1(1))*(p-x1(2)) + res(6)*(p-x1(1))*(p-x1(2))*(p-x1(3));
pretty(eq)
fprintf("\nJika disubstitusikan p=2 maka didapat nilai A: (jika jarak setiap pixel 1)\nA= ")
disp(double(subs(eq, 2)))

fprintf("\n\nMencari E, dengan interpolasi lagrange\n")
l1= (p-x3(2))/(x3(1)-x3(2))*(p-x3(3))/(x3(1)-x3(3))*(p-x3(4))/(x3(1)-x3(4));
l2= (p-x3(1))/(x3(2)-x3(1))*(p-x3(3))/(x3(2)-x3(3))*(p-x3(4))/(x3(2)-x3(4));
l3= (p-x3(1))/(x3(3)-x3(1))*(p-x3(2))/(x3(3)-x3(2))*(p-x3(4))/(x3(3)-x3(4));
l4= (p-x3(1))/(x3(4)-x3(1))*(p-x3(2))/(x3(4)-x3(2))*(p-x3(3))/(x3(4)-x3(3));
eq1= row3(1)*l1 + row3(2)*l2 + row3(3)*l3 + row3(4)*l4;
fprintf("\nSehingga didapat fungsi sebenarnya f(p):\n");
disp(simplify(eq1))
fprintf("\nJika disubstitusikan p=2 maka didapat nilai E: (jika jarak setiap pixel 1)\nE= ")
disp(double(subs(eq1, 2)))

fprintf("\n\nMencari B terlebih dahulu, dengan interpolasi lagrange,\nagar C dan D didalam jika dilakukan horizontal\n")
l1= (p-3)/(1-3);
l2 = (p-1)/(3-1);
eq2= row1(1)*l1 + row3(1)*l2;
fprintf("\nSehingga didapat fungsi sebenarnya f(p):\n");
disp(simplify(eq2))
fprintf("\nJika disubstitusikan p=2 maka didapat nilai B: (jika jarak setiap pixel 1)\nB= ")
disp(double(subs(eq2, 2)))
row2(1)= double(subs(eq2, 2));

fprintf("\n\nMencari C dan D, dengan interpolasi lagrange,secara horizontal\n")
l1= (p-x2(2))/(x2(1)-x2(2))*(p-x2(3))/(x2(1)-x2(3));
l2= (p-x2(1))/(x2(2)-x2(1))*(p-x2(3))/(x2(2)-x2(3));
l3= (p-x2(1))/(x2(3)-x2(1))*(p-x2(2))/(x2(3)-x2(2));
eq3= row2(1)*l1 + row2(2)*l2 + row2(3)*l3;
fprintf("\nSehingga didapat fungsi sebenarnya f(p):\n");
disp(simplify(eq3))
fprintf("\nJika disubstitusikan p=2 dan p=3 maka didapat nilai C dan D: (jika jarak setiap pixel 1)\nC= ")
disp(double(subs(eq3, 2)))
fprintf("D= ");
disp(double(subs(eq3, 3)))

