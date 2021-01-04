#!/bin/sh
# ./createJobs.py data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_ 3 data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_DiskShifted.db SingleMuon_2018A-PromptReco_V1+V2_V1_not_complete_RECO.py --json Cert_314472-316271_13TeV_PromptReco_Collisions18_JSON.txt --inputInBlocks -s data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter.sh --validationLabel data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter --b --user_mail youremail --minTrackPt 30 --maxTrackPt 200 --maxDxy 0.2 --minNCrossedChambers 1 --residualsModel pureGaussian --peakNSigma 1.6 --station123params 111111 --station4params 101111 --cscparams 110001 --useResiduals 1100 --mapplots --curvatureplots --segdiffplots --extraPlots --globalTag 101X_dataRun2_Prompt_TrackAlignAPE_w22_2018 --createAlignNtuple --noCleanUp --noDT --gprcdconnect sqlite_file:GPR_Nov12_2017_SW940_run302131-303790_dL4_iter1.db --gprcd IdealGeometry --is_Alca --T0

export ALIGNMENT_CAFDIR=`pwd`
mkdir files
mkdir out

cd /afs/cern.ch/work/g/grnewton/public/cmsPlots/CMSSW_11_1_4/src/
eval `scramv1 run -sh`
ALIGNMENT_AFSDIR=`pwd`
ALIGNMENT_ITERATION=3
ALIGNMENT_MAPPLOTS=True
ALIGNMENT_SEGDIFFPLOTS=None
ALIGNMENT_CURVATUREPLOTS=None
ALIGNMENT_EXTRAPLOTS=True
export ALIGNMENT_GPRCDCONNECT=sqlite_file:GPR_Nov12_2017_SW940_run302131-303790_dL4_iter1.db
export ALIGNMENT_GPRCD=IdealGeometry
export ALIGNMENT_DO_DT=False
export ALIGNMENT_DO_CSC=True


# copy the scripts to CAFDIR
cd Alignment/MuonAlignmentAlgorithms/scripts/
cp -f plotscripts.py $ALIGNMENT_CAFDIR/
cp -f mutypes.py $ALIGNMENT_CAFDIR/
cp -f alignmentValidation.py $ALIGNMENT_CAFDIR/
cp -f phiedges_fitfunctions.C $ALIGNMENT_CAFDIR/
cp -f createTree.py $ALIGNMENT_CAFDIR/
cp -f signConventions.py $ALIGNMENT_CAFDIR/
cp -f convertSQLiteXML.py $ALIGNMENT_CAFDIR/
cp -f wrapperExtraPlots.sh $ALIGNMENT_CAFDIR/
cd -
cp Alignment/MuonAlignmentAlgorithms/test/browser/tree* $ALIGNMENT_CAFDIR/out/

# copy the results to CAFDIR
cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01_report.py $ALIGNMENT_CAFDIR/files/
cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03_report.py $ALIGNMENT_CAFDIR/files/
cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01.root $ALIGNMENT_CAFDIR/files/
cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03.root $ALIGNMENT_CAFDIR/files/
if [ -e data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01_plotting.root ] && [ -e data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03_plotting.root ]; then
  cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01_plotting.root $ALIGNMENT_CAFDIR/files/
  cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03_plotting.root $ALIGNMENT_CAFDIR/files/
  ALIGNMENT_MAPPLOTS=True
  ALIGNMENT_SEGDIFFPLOTS=True
  ALIGNMENT_CURVATUREPLOTS=True
fi

dtcsc=""
if [ $ALIGNMENT_DO_DT == "True" ]; then
  dtcsc="--dt"
fi
if [ $ALIGNMENT_DO_CSC == "True" ]; then
  dtcsc="${dtcsc} --csc"
fi


cd $ALIGNMENT_CAFDIR/
echo " ### Start running ###"
date

# do fits and median plots first 
./alignmentValidation.py -l data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01 --iNprefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03 -o $ALIGNMENT_CAFDIR/out  --createDirSructure --dt --csc --fit --median

if [ $ALIGNMENT_MAPPLOTS == "True" ]; then
  ./alignmentValidation.py -l data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01 --iNprefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03 -o $ALIGNMENT_CAFDIR/out  $dtcsc --map
fi

if [ $ALIGNMENT_SEGDIFFPLOTS == "True" ]; then
  ./alignmentValidation.py -l data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01 --iNprefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03 -o $ALIGNMENT_CAFDIR/out  $dtcsc --segdiff
fi                   

if [ $ALIGNMENT_CURVATUREPLOTS == "True" ]; then
  ./alignmentValidation.py -l data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01 --iNprefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03 -o $ALIGNMENT_CAFDIR/out  $dtcsc --curvature
fi

if [ $ALIGNMENT_EXTRAPLOTS == "True" ]; then
  if [ "zzzGPR_Nov12_2017_SW940_run302131-303790_dL4_iter1.db " != "zzz" ]; then
    cp -f $ALIGNMENT_AFSDIR/GPR_Nov12_2017_SW940_run302131-303790_dL4_iter1.db  $ALIGNMENT_CAFDIR/
  fi
  cp $ALIGNMENT_AFSDIR/inertGlobalPositionRcd.db .
  ./convertSQLiteXML.py $ALIGNMENT_AFSDIR/data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_DiskShifted.db g0.xml --noLayers  --gprcdconnect $ALIGNMENT_GPRCDCONNECT --gprcd $ALIGNMENT_GPRCD
  ./wrapperExtraPlots.sh -n $ALIGNMENT_ITERATION -i $ALIGNMENT_AFSDIR -0 g0.xml -z -w 111111 data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter
  mkdir out/extra
  cd data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter
  mv MB ../out/extra/
  mv ME ../out/extra/
  cd -
fi

# run simple diagnostic
./alignmentValidation.py -l data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter -i $ALIGNMENT_CAFDIR --i1 files --iN files --i1prefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_01 --iNprefix data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_03 -o $ALIGNMENT_CAFDIR/out --dt --csc --diagnostic

# fill the tree browser structure: 
./createTree.py -i $ALIGNMENT_CAFDIR/out

timestamp=`date "+%y-%m-%d %H:%M:%S"`
echo "data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter.plots (${timestamp})" > out/label.txt

ls -l out/
timestamp=`date +%Y%m%d%H%M%S`
tar czf data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_${timestamp}.tgz out
cp -f data_CSC-1100-110001_2018AFULL_314472-316271_CMSSW101_SingMu_MuAlCalIsoMuv1_101dataRun2PromptTrackAlignAPE_w22_2018_3iter_${timestamp}.tgz $ALIGNMENT_AFSDIR/

