function [X, Y] = loadComment(names, messages, spam, vocabList, vocabulario)    
X = [];
messagesIND = find(spam == 0);
msg = cell(rows(messagesIND),1);
counter = 1;
for i = 1:rows(messages)
	if (any(messagesIND == i))
		msg{counter} = messages{i};
		counter++;
	endif
endfor

disp(rows(msg));
for j = 1:rows(msg)
	wor_s = processEmail(msg{j});
	Xi = zeros(1, length(vocabList));
	while ~isempty(wor_s)
		[str,wor_s] = strtok(wor_s,[' ']);
		if isfield(vocabulario,str)
			Xi(vocabulario.(str))=1;
		endif
	endwhile
	X = [X;Xi];
endfor 
Y = zeros(rows(X), 1);
save ham.mat X Y;
endfunction