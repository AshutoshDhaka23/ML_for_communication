data = load('TrainingDataRamanAmp.mat');
fields = fieldnames(data);
gain_cell = data.(fields{1});

iter = length(gain_cell);
hmm = length(gain_cell{1,1});

for i=1:iter
    for j=1:hmm
    column_data = gain_cell{i,j};
    end
end
