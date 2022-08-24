
![header](/Tutoriales-IFC/assets/header.png)







































# Uso del contenedor de Juicer 

3DGenome tiene instalado un [contenedor de Singularity de Juicer](https://github.com/rnakato/docker_juicer)

## Ejecución

- Correr un comando
```bash
$ juicer_singularity <comando>
```

- Entrar en modo shell ('acceder' al contenedor como si fuese una computadora distinta, __PRECAUCIÓN: puede resultar bastante confuso si no se sabe lo que se hace, ó incluso si se sabe lo que se hace__)
```bash
$ juicer_singularity_shell
```

## Script ejemplo

### Precisiones para el uso dentro del IFC

3DGenome cuenta con la carpeta `/work/Database/bwa-indexes/` con permisos de escritura para todos los usuarios la carpeta `fastq` debe crearse en el directorio en el cual se esté ejecutando el programa e incluir los fastq pertinentes.

### Instrucciones

__Las siguientes líneas son la transcripción de las instrucciones del [desarrollador](https://hub.docker.com/u/rnakato) , tomadas CON modificaciones para su uso dentro del IFC desde su página de [Github.](https://github.com/rnakato/docker_juicer)__

___

These scripts assume that the fastq files are stored in `fastq/$cell` (e.g., `fastq/Control_1`).
The outputs are stored in `JuicerResults/$cell`.

The BWA index files should be at `/work/Database/bwa-indexes/UCSC-$build`.

The whole commands using the Singularity image (`rnakato_juicer.sif`) are as follows:

    build=hg38
    fastq_post="_R"  # "_" or "_R"  before .fastq.gz
    enzyme=MboI      # enzyme type
    
    gt=genome_table.$build.txt  # genome_table file
    gene=refFlat.$build.txt # gene annotation (refFlat format)
    sing="juicer_singularity"  # singularity command
    
    for cell in `ls fastq/* -d | grep -v .sh`
    do
        cell=$(basename $cell)
        odir=$(pwd)/JuicerResults/$cell
        echo $cell
    
        rm -rf $odir
        mkdir -p $odir
        if test ! -e $odir/fastq; then ln -s $(pwd)/fastq/$cell/ $odir/fastq; fi
    
        # generate .hic file by Juicer
        $sing juicer_map.sh $odir $build $enzyme $fastq_post
    
        # plot contact frequency
        if test ! -e $odir/distance; then $sing plot_distance_count.sh $cell $odir; fi
    
        # select normalization type
        norm=VC_SQRT
        
        # make contact matrix for chromosomes
        hic=$odir/aligned/inter_30.hic
        if test ! -e $odir/Matrix; then
            $sing juicer_makematrix.sh $norm $hic $odir $gt
        fi

        # call TADs (arrowHead)
        if test ! -e $odir/TAD; then
            $sing juicer_callTAD.sh $norm $hic $odir $gt
        fi
    
        # calculate Pearson coefficient and Eigenvector
        for resolution in 25000
        do
                $sing makeEigen.sh Pearson $norm $odir $hic $resolution $gt $gene
                $sing makeEigen.sh Eigen $norm $odir $hic $resolution $gt $gene
        done
        
        # calculate insulation score
        if test ! -e $odir/InsulationScore; then $sing juicer_insulationscore.sh $norm $odir $gt; fi
        
        # call loops (HICCUPS, add '--nv' option to use GPU)
        singularity exec --nv rnakato_juicer.sif call_HiCCUPS.sh $norm $odir $hic $build
        # motif analysis
        $sing juicertools.sh motifs $build $motifdir $odir/loops/$norm/merged_loops.bedpe hg38.motifs.txt
    done

___

























![header](/Tutoriales-IFC/assets/header.png)

