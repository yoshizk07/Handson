#!/bin/bash

#export ESPRESSO_PSEUDO=${ESPRESSO_ROOT}/pseudo
ESPRESSO_PSEUDO=`pwd`
export NETWORK_PSEUDO=http://www.quantum-espresso.org/wp-content/uploads/upf_files/

if test "`which curl`" = "" ; then
   if test "`which wget`" = "" ; then
      echo "### wget or curl not found: will not be able to download missing PP ###"
   else
      DOWNLOADER="wget -O"
      # echo "wget found"
   fi
else
   DOWNLOADER="curl -o"
   # echo "curl found"
fi

inputs=`find $1* -type f -name "*.in" -not -name "test.*" -not -name "benchmark.*"`
pp_files=`for x in ${inputs}; do grep UPF ${x} | awk '{print $3}'; done`

for pp_file in ${pp_files} ; do
if ! test -f ${ESPRESSO_PSEUDO}/${pp_file} ; then 
        #echo -n "Downloading ${pp_file} to ${ESPRESSO_PSEUDO} ... "
        ${DOWNLOADER} ${ESPRESSO_PSEUDO}/${pp_file} ${NETWORK_PSEUDO}/${pp_file} 2> /dev/null
        if test $? != 0 ; then 
                echo "Download of" ${pp_file} "FAILED, do it manually -- Testing aborted!"
                exit -1
        #else
                #echo "done."
        fi
#else
        #echo "No need to download ${pp_file}."
fi
done
