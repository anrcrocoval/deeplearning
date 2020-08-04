  /**  
   *   The purpose of the macro is to facilitate reannotation of 2D labels to cretae 3D labels, by
   *   1) Selecting a new color by right clicking
   *   2) clicking on label will fill it with this color and then go to the next slice
   *   
   */
      
      shift=1;
      ctrl=2; 
      rightButton=4;
      alt=8;
      leftButton=16;
      insideROI = 32; // requires 1.42i or later

      x2=-1; y2=-1; z2=-1; flags2=-1;
      logOpened = false;
      if (getVersion>="1.37r")
          setOption("DisablePopupMenu", true);
      currentlabel=10;
      print('start annotating: right click to increment label, left click to attribute label');
      while (!logOpened || isOpen("Log")) {
          getCursorLoc(x, y, z, flags);
          if (x!=x2 || y!=y2 || z!=z2 || flags!=flags2) {
              s = " ";
              if (flags&leftButton!=0 && z==z2) {
              	//print(x+" "+y+" "+z+" "+flags );
              	slice=z+1;
              	floodFill(x, y);
              	
              	if (slice<nSlices){
              		setSlice(slice+1);
              	}
              		
              		else {
              			print ('last slice reached');
              		}

              	wait(10);
              }
              if (flags&rightButton!=0) { //change label setcolor 
                print('label was '+currentlabel+' and is now '+ currentlabel+1);
                currentlabel++;
              	setColor(currentlabel);
              }
              
              
              logOpened = true;
              startTime = getTime();
          }
          x2=x; y2=y; z2=z; flags2=flags;
          wait(10);
      }
      if (getVersion>="1.37r")
          setOption("DisablePopupMenu", false);