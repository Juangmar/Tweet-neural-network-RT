loader;

vocabList = getVocabList('vocab.txt');

for i = 1:length(vocabList)  
	x = vocabList{i};  
	struct.(x) = i;
endfor

[X_c, y_c] = loadComment(names, messages, spam, vocabList, struct);
[X_s, y_s] = loadSpam(names, messages, spam, vocabList, struct); 

lim_c = floor(rows(X_c) * 0.8);
lim_s = floor(rows(X_s) * 0.8);

X = [ X_c(1:lim_c,:) ; X_s(1:lim_s,:) ];
y = [ y_c(1:lim_c,:) ; y_s(1:lim_s,:) ];

Xval = [ X_c(lim_c+1:end,:) ; X_s(lim_s+1:end,:) ];
yval = [ y_c(lim_c+1:end,:) ; y_s(lim_s+1:end,:) ];

save data.mat X Xval y yval vocabList;