
Some tips for remote CMSSW development with Eclipse (might also work for other IDEs).
======

The following will only cover using Eclipse as an editor with syntax completion. It does not cover using it to compile and or debug. Both of these are possible, but require a deeper integration of Eclipse in the build process.


Setting everything up
---

- Download and install Eclipse CDT and install the pydev package in addition (in Eclipse: Help -> Install new software -> Work with: PyDev - http://www.pydev.org/updates)

- You can run Eclipse while setting the working (and meta data) directory to something other than the standard by calling it with: `eclipse -data` (this is recommended)
- If you want to use a certain python environment (e.g. with DeepJetCore installed), switch to it before launching Eclipse, so Eclipse is aware of the path changes. I recommend creating a start script.


Mount your working directories
---

You need access to your working directories (e.g. on lxplus) from your local machine. For MacOS, MacFuse does work in principle, but is not very stable and tends to create trouble with the system/finder. There is also Expandrive and Mountainduck. The former has created serious issues (corrupted files) which is why I don't recommend it. Mountainduck seems the most stable. The synchronisation from local to host is fast and reliable. The other way can take a while and sometimes needs a manual prompt. But since local to host is the one we need the most, this is good.
Sometimes it might still lose connection, so reconnecting every few days should help (basically whenever you see files missing).
Both, Expandrive and Mountainduck are not free (but also not expensice, have free trail periods, and discounts for academic users).


Make Eclipse CMSSW aware
---

- On lxplus, use the tarCMSSW tool to get all headers of a certain release
- Copy the tar to your local machine and untar it to a folder: <my_cmssw_headers>
- Set up a new project in Eclipse: File -> new -> C++ project -> Empty project -> MacOS gcc (or other not-cross compiler)
- *don't* click finish. Go to 'next' and uncheck 'debug'
- Now click finish
- Select 'Project' in the upper bar and *unselect* Build Automatically (since we only set up for editing)

- Right click on your brand new project and select 'properties'
- The most important for editor work is the section C/C++ General -> Paths and symbols
- Under include -> GNU C++ add your untared CMSSW folder (and anything else you'd like to appear in your syntax completion)
- Under source location, you *link* your folder in the file system that contains the code you want to edit
- You will get prompted to *rebuild* the index, please do so. It will take a while but is needed to recognise all classes.

- In case root is not installed on the computer locally, I recommend to do that. But in principle, only the headers are needed for editing and can be extracted e.g. from CMSSW, too (by just copying the include directories and adding them following the procedure above).


Make Eclipse DeepJet/HGCalML aware
---

I recommend creating a new project for this (actually for every *project* you are working on). This helps keep track of things. 

- I recommend installing DeepJetCore and dependencies locally (see DeepJetCore readme) e.g. using conda. After adding it to the python path *before* launching Eclipse should make the classes available.
- Switch to PyDev perspective: this is a small icon in the top right that should appear after having installed PyDev.
- Create a new *PyDev* project (now if you go to File -> New you will see PyDev project now)
- Just follow the wizard. If the python environment is set up *before* launching Eclipse the standard checkboxes should do.

- Add the remote HGCalML code repository to your source directories (as described for CMSSW above)
- In case DeepJetCore bindings don't work, you can add it manually in Project -> properties -> PyDev-PYTHONPATH -> External libraries 
- In the same configuration window, under 'source folders' add `HGCalML/modules' and 'HGCalML/modules/datastructures'.








