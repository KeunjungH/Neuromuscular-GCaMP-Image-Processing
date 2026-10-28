// Annika Naveen
// August 5th, 2024
// Purpose: use on the raw data exported from the Phenix to consolidate time series / z-stacks / multiple channels
// I've only actually tested this in the context of time series, as well as z-stack + multiple channels, but it should be
//	set up to work for more combinations of measurement types

// NOTE: use the filepath to the actual name of the measurements taken; the macro will open the "Images" folder itself
// NOTE: assumes that the files will be still be named with the exported format "r02c02f01p01-ch1sk6fk1fl1.tiff"

// figure out what kind of Phenix measurements these are to figure out how to merge the image sequence
Dialog.create("Phenix Measurements");
Dialog.addString("filepath to folder containg AssayLayout & Images", "");
Dialog.addMessage("Please keep any non-used parameters set to 1");
Dialog.addNumber("number of image slices per video", 1);
Dialog.addNumber("number of z slices per z-stack", 1);
Dialog.addNumber("number of channels per image", 1);
Dialog.show();
filepath = Dialog.getString();
numTimeSlices = Dialog.getNumber();
numZSlices = Dialog.getNumber();
numChannels = Dialog.getNumber();

// creates new "Videos" folder to save these image sequences in
print(filepath+File.separator+"Images");
File.makeDirectory(filepath+File.separator+"Videos");
list = getFileList(filepath+File.separator+"Images");

factor = numTimeSlices*numZSlices*numChannels;
numVideos = (list.length-1)/factor;
print("Creating "+numVideos*numChannels+" videos");

if ((numTimeSlices>1 && numZSlices>1 && numChannels<=1) || (numTimeSlices>1 && numZSlices>1 && numChannels>1)) {
	print("program does not currently support these kinds of Phenix measurements");
} else {
	for (i = 0; i < numVideos; i++) {
		for (j = 1; j <= numChannels; j++) {
			name = substring(list[factor*i+j], 0, 16);
			File.openSequence(filepath+File.separator+"Images", "start="+(j+i*factor)+" step="+numChannels+" count="+factor/numChannels);
			//run("AVI... ", "compression=None frame=10 save="+filepath+File.separator+"Video"+File.separator+name);
			saveAs("Tiff", filepath+File.separator+"Videos"+File.separator+name);
			close();
			print("finished with video #"+(i+1));
		}
	}
}

print("done");