A = input('Masukkan (koefisien) Matriks A : ');
B = input('Masukkan (koefisien) Matriks B : ');
N = length(B);
X = zeros(N, 1);
Aug = [A B];

% Pertukaran baris jika elemen diagonal utama pada baris pertama adalah nol
if Aug(1, 1) == 0
    % Cari baris dengan elemen diagonal utama tidak nol di kolom pertama
    non_zero_row = find(Aug(:, 1) ~= 0, 1, 'first');

    % Tukar baris pertama dengan baris yang memiliki elemen diagonal utama tidak nol
    Aug([1, non_zero_row], :) = Aug([non_zero_row, 1], :);
end

disp('Matriks Awal:');
disp(Aug);

for j = 1:N
    fprintf('--- Tahap %d ---\n', j);
    Aug(j, :) = Aug(j, :) / Aug(j, j);
    disp('Matriks setelah normalisasi:');
    disp(Aug);

    for i = 1:N
        if i ~= j
            m = Aug(i, j);
            Aug(i, :) = Aug(i, :) - m * Aug(j, :);
        end
    end

    disp('Matriks setelah eliminasi:');
    disp(Aug);
end

% Menampilkan hasil
disp('Hasil eliminasi Gauss-Jordan:');
disp(Aug(:, end));
