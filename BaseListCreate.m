clc
clear
filename = sprintf('BaseScript.iqx');
fid = fopen(filename,'w');

FF = string(ones(1,81));
FP = string(ones(1,81));
PP = string(ones(1,81));
for i = 1:81
    FF(i) = 'FF';
    FP(i) = 'FP';
    PP(i) = 'PP';
end

locationCombination = [FF FP PP];
Circle_1 = [];
Circle_2 = [];
for i = 1:9
    temp_1 = i * ones(1,9)';
    temp_2 = (1:9)';
    Circle_1 = cat(1,Circle_1,temp_1);
    Circle_2 = cat(1,Circle_2,temp_2);
end

Circle_1 = [Circle_1;Circle_1;Circle_1];
Circle_2 = [Circle_2;Circle_2;Circle_2];
location_order = randperm(243);
locationCombination_random = locationCombination(location_order);

Circle_1_random = Circle_1(location_order);
Circle_2_random = Circle_2(location_order);
ColorCombination_random = cat(2,Circle_1_random,Circle_2_random);

final = cat(2,locationCombination_random',ColorCombination_random);

fprintf(fid,'<item PositionComination>\n');
for present_order_location = 1:length(locationCombination_random)
    fprintf(fid,'/%d = "%s"\n',present_order_location,locationCombination_random(present_order_location));
end
fprintf(fid,'</item>\n\n');

fprintf(fid,'<item Circle_1_color>\n');
for present_order_color_1 = 1:length(Circle_1_random)
    fprintf(fid,'/%d = "%d"\n',present_order_color_1,Circle_1_random(present_order_color_1));
end
fprintf(fid,'</item>\n\n');

fprintf(fid,'<item Circle_2_color>\n');
for present_order_color_2 = 1:length(Circle_2_random)
    fprintf(fid,'/%d = "%d"\n',present_order_color_2,Circle_2_random(present_order_color_2));
end
fprintf(fid,'</item>\n\n');
fclose(fid);






