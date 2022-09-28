% Generate documentation.
package_name = '+mypackage';
output_dir = 'helpfiles';
examples_dir = 'examples';
package_dir = ['.' filesep package_name];

% Create output directory
mkdir(output_dir);

disp('Generating toolbox API reference...')
toolbox_filenames = what(package_dir);
toolbox_filenames = toolbox_filenames.m;

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

disp('Generating toolbox example pages...')
addpath(examples_dir, '.')

example_filenames = what(examples_dir);
example_filenames = example_filenames.m;
old_dir = cd;
cd(package_dir);
for ind = 1:length(example_filenames)
    filename = example_filenames{ind};
    disp(['Converting ', filename, ' to HTML (', int2str(ind), '/', int2str(length(example_filenames)), ')'])
    publish(filename, ...
        'format', 'html', ...
        'outputDir', ['..' filesep output_dir], ...
        'evalCode', true, ...
        'showCode', true);
end
cd(old_dir);

% Before constructing table of contents, remove root doc page
% as it is manually included at the top level
toolbox_filenames(contains(toolbox_filenames, 'index.m')) = [];

% Generate helptoc.xml file from list of .m source files
addToXML('<?xml version=''1.0'' encoding="utf-8"?>');
addToXML('<toc version="2.0">');
addToXML('<tocitem target="index.html">Sample MATLAB toolbox');

% Add links to API reference
addToXML('<tocitem target="">Reference');
for ind = 1:length(toolbox_filenames)
    [~, func_name, ~] = fileparts(toolbox_filenames{ind});
    addToXML(['<tocitem target="' func_name '.html">' func_name '</tocitem>']);
end
addToXML('</tocitem>');

% Add links to examples
addToXML('<tocitem target="">Examples');
for ind = 1:length(example_filenames)
    [~, example_name, ~] = fileparts(example_filenames{ind});
    addToXML(['<tocitem target="' example_name '.html">' example_name '</tocitem>']);
end
addToXML('</tocitem>');

addToXML('</tocitem>');
addToXML('</toc>');

% convenience function to call writelines
function addToXML(line)
    output_dir = 'helpfiles';
    filename = [output_dir filesep 'helptoc.xml'];
    writelines(line, filename, 'WriteMode','append');
end
