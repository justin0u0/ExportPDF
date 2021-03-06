JsOsaDAS1.001.00bplist00?Vscript_?
function keynoteExportPDF(keynote, inFile) {
	console.log('inFile:', inFile.toString());

	const outFile = Path(inFile.toString().replace(/\.[^\.]+$/, '.pdf'));
	console.log('outFile:', outFile.toString());

	const document = keynote.open(inFile);

	keynote.export(document, {to: outFile, as: 'PDF'});

	keynote.close(document, {saving: 'no'});
}

const app = Application.currentApplication();
app.includeStandardAdditions = true;

const inFiles = app.chooseFile({
    withPrompt: 'Please select a document to process:',
	ofType: ['ppt', 'pptx', 'keynote.key'],
	multipleSelectionsAllowed: true
});

const keynote = Application('Keynote');

keynote.activate();

for (const inFile of inFiles) {
	keynoteExportPDF(keynote, inFile);
}

keynote.quit();
app.quit();
                              jscr  ??ޭ