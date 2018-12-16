function [X_c, y_c] = loadComment(names, messages, spam, vocabList, vocabulario)    
X_c = [];
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
	X_c = [X_c;Xi];
endfor 
y_c = ones(rows(X_c), 1);
endfunction