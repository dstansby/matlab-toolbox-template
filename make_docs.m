% Generate documentation.

output_dir = 'helpfiles';
package_name = '+mypackage';
package_dir = ['.' filesep package_name];

% Create output directory
if exist(output_dir, 'file')
    rmdir(output_dir, 's');
end
mkdir(output_dir);

% Get a list of toolbox m-files
toolbox_filenames = what(package_dir);
toolbox_filenames = toolbox_filenames.m;

disp('Generating toolbox HTML...')
old_dir = cd;
cd(package_dir);
for ind = 1:length(toolbox_filenames)
    filename = toolbox_filenames{ind};
    disp(['Converting ', filename, ' to HTML (', int2str(ind), '/', int2str(length(toolbox_filenames)), ')'])
    publish(filename, ...
        'format', 'html', ...
        'outputDir', ['..' filesep output_dir], ...
        'evalCode', false, ...
        'showCode', false);
end
cd(old_dir);

% Generate helptoc.xml file from list of .m source files
addToXML('<?xml version=''1.0'' encoding="utf-8"?>');
addToXML('<toc version="2.0">');
% Automatically add links for all .m source files
addToXML('<tocitem target="">Functions');
for ind = 1:length(toolbox_filenames)
    [~, func_name, ~] = fileparts(toolbox_filenames{ind});
    addToXML(['<tocitem target="' func_name '.html">' func_name '</tocitem>']);
end
addToXML('</tocitem>');
addToXML('</toc>');

% convenience function to call writelines
function addToXML(line)
    output_dir = 'helpfiles';
    filename = [output_dir filesep 'helptoc.xml'];
    writelines(line, filename, 'WriteMode','append');
end
