# GitHub CLI

__GitHub CLI__ es la interfáz oficial de línea de comandos para _GitHub_.

Contiene herramientas útiles para crear, clonar y modificar repositorios entre otras. De igual
modo, incluye comandos para revisar, modificar y crear _issues_ y manejar otras herramientas
de _GitHub_. Pueden consultar la página oficial aquí [GitHub CLI](https://cli.github.com/), donde
también encontrarán las instrucciones de instalación en distintos sistemas operativos y 
configuración de la herramienta.


## Algunos comandos útiles.

1. Crear un repositorio nuevo.

   ```
   gh repo create UBMI-IFC/test_tf_cpu_gpu \
      -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" \
	  --private --clone -g Python -l gpl-3.0
   ```
   
   - `-d` descripción del repositorio.
   - `--private` crear el repositorio cómo privado. Alternativamente se puede usar la 
     opción `--public`.
   - `--clone` clonar el repositorio en la carpeta actual.
   - `-g` especificar un templete de archivo *gitignore*
     [lista de templetes](https://github.com/github/gitignore).
   - `-l` especificar licencia. Esta opción es un poco engañosa. No es fácil encontrar
     el nombre específico de cada licencia. Algunos ejemplos son **gpl-3.0**, **gpl-2.0**,
	 **lgpl-3.0**, **mit**. [Aquí](https://github.com/github/choosealicense.com/tree/gh-pages/_licenses) se pueden encontrar algunas licencias. *Aparentemente* el nombre de la licencia 
	 aceptada por `gh` es el nombre de los archivos en el *link* (sin la extensión `.txt`).
   


2. Enlistar los repositorios de tu usuario u organización.

   ```
   gh repo list
   ```
   
   ```
   gh repo list UBMI-IFC
   ```

3. Clonar un repositorio preexistente.

   ```
   gh repo clone UBMI-IFC/Tutoriales-UFC
   ```
   
4. Crear un nuevo _issue_. Debes estar en la carpeta del repositorio en el que quieres crear
   el repositorio.
   
   ```
   gh issue create --label "help wanted" --assignee "cperalta22" --title "Add license" \
    --body "Please add a license, it may be bGPLv3, GPLlv3 or MIT"
   ```
   
   - `--label` etiqueta del *issue*.
   - `--assignee` usuario al que se le asigna la solución del *issue*.
   - `--title` título del *issue*.
   - `--body` cuerpo del *issue*.
   
5. Visualizar los *issues* asignados a uno mismo.

   ```
   gh issue list --assignee "@me"
   ```

6. Navegar en la versión *web* del repositorio. Tienes que estar en la carpeta del repositorio que
   quieres visualizar.
   
   ```
   gh browse
   ```


gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -g Python -l gpl-3.0
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -g Python -l Gpl3
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -g Python -l Gplv3
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -g Python -l GPL3
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -g Python -l GPLv3.0
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -g Python -l GPLv3
gh repo create -h
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -l "GNU General Public License v3.0"
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -l GNU General Public License v3.0
ssh ubmi01
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -l gplv3
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -l gpl-3
gh repo create UBMI-IFC/test_tf_cpu_gpu -d "Script(s) for testing execution time of Keras-TF ANN training in CPU and GPU" --private -l gpl3
gh repo list ubmi-ifc
gh repo list
gh repo create ?
cd repos/
cp .emacs.d/init.el Dropbox/config/init.el.nuevo_ubmi03
ls Dropbox/config/
ls .emacs.d/backup/
ls -la *pru*
ls -ltr
emacs
ls .
ls -ltra
emacs test_keras_audio_commands.py
c telegram_speak.sh
c telegram_speak.py
ls telegram_speak.py
rm \#test_cpu_gpu.py\#
diff \#test_cpu_gpu.py\# test_cpu_gpu.py
ls \#test_cpu_gpu.py\#
rm *\~
ls *\~
cd
htop
watch nvidia-smi
emacs test_keras_text.py
ipython
c test_keras_text.py
c test_cpu_gpu.py
touch BUAHAHAHA
less combined_chrom_segments_k562.bed
ls combined_chrom_segments_k562.bed
rm chromHMM_k562.fa
ls -ltrh
ls chromHMM_k562.fa
less chromHMM_k562.fa
grep chromHMM_k562.fa
grep -c '>' promoters_k562.fa
less promoters_k562.fa
less insulators_k562.fa
less weak_enhancers_k562.fa
cd chromatin_functional_annotations/
ls chromatin_functional_annotations/
cd /UBMInas/databases/
ls /UBMInas/databases/
espeak -f Descargas/refseq/complete.faa -g 15 -v es-la
espeak -f test_keras_text.py -g 15 -v es-la
espeak 'Borra tus archivos' -g 15 -v es-la
espeak --voices
espeak 'Borra tus archivos' -g 15 -v es
espeak 'Bueno, es una prueba' -g 15 -v es
espeak 'Bueno, es una prueba' -g 15
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/
man espeak
espeak 'Bueno, es una prueba' -a 10
espeak 'Bueno, es una prueba' -a 200
espeak 'Bueno, es una prueba'
sudo aptitude install espeak
aptitude isntall espeak
grep -c '>'  RefSeq_protein/*.faa
ls -hltr RefSeq_protein/
ls -ltr RefSeq_protein/
ls RefSeq_protein/
grep -c '>' *.faa
cat *.faa > refseq.faa
ls *.faa
tail complete.faa
tail complete
tail nonredundant.faa
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.nonredundant_protein.* > nonredundant.faa
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.nonredundant_protein.* | wc
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.nonredundant_protein.*
ls -lh
rm protein*.faa
ls protein*.faa
cat *.faa > complete.faa
grep -f nonredundantsample.txt headers_nonredundant.txt
grep -f nonredundantsample.txt headers_complete.txt
grep -f nonredundantsample.txt nonredundantsample.txt
shuf -n 10 headers_nonredundant.txt | cut -f 1 -d ' ' > nonredundantsample.txt
grep -f completesample.txt headers_complete.txt
grep -f completesample.txt headers_nonredundant.txt
grep -f completesample.txt completesample.txt
cat completesample.txt
shuf -n 10 headers_complete.txt | cut -f 1 -d ' ' > completesample.txt
shuf -n 10 headers_complete.txt | cut -f 1 > completesample.txt
shuf -n 10 headers_complete.txt
head headers_complete.txt
wc headers_complete.txt
cat *.faa | grep '>' -c
cd Descargas/refseq/
wc headers_*
df -h
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.nonredundan*.protein.faa.gz | grep '>' > headers_nonredundant.txt
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.nonredundatn*.protein.faa.gz | grep '>' > headers_nonredundant.txt
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.*
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.????.protein.faa.gz | grep '>' > headers_complete.txt
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.????.protein.faa.gz
wget -N --mirror "ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete/*.faa.gz"
cat *faa | grep -c '>'
man crc32
tldr crc32
crc32
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.???.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.??.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.?.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.?.protein.faa.gz | wc
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.*.protein.faa.gz | wc
wc ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.*.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.*.protein.faa.gz
ls -ltrh protein*
ls -ltrh protein.faa
rm protein.faa
zcat complete.4345.rna.fna.gz | grep '>' | tail
zcat complete.4345.protein.faa.gz  | grep '>' | tail
zcat complete.4345.protein.faa.gz  | grep '>'
zcat complete.4345.*
zcat complete.4330.*
rm complete.4330.*
ls complete.4330.*
zcat complete.4330.protein.faa.gz
zcat complete.4330.protein.faa.gz | grep '>' | head
zcat complete.4330.protein.faa.gz | grep '>' | tail
zcat complete.4330.* | grep '>' | tail
cd Descargas/
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete*protein.faa.gz | less
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.???.protein.faa.gz | less
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.????.protein.faa.gz | less
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.?100.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.1???.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.2???.protein.faa.gz
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.1???.protein.faa.gz > protein1.faa
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.2???.protein.faa.gz > protein2.faa
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.3???.protein.faa.gz > protein3.faa
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4???.protein.faa.gz > protein4.faa
for FILE in for FILE in ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4???.protein.faa.gz ;
echo $FILE
zcat $FILE | head
echo '---------------------------------------------'
end
for FILE in for FILE in ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4???.protein.faa.gz ;
echo $FILE
head $FILE
echo '---------------------------------------------'
end
for FILE in for FILE in ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4???.protein.faa.gz ;
echo $FILE
end
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4???.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.5???.protein.faa.gz
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4409.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.44??.protein.faa.gz
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.4400.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.????.protein.faa.gz | tail
tail -1000 protein.faa
tail -40 protein.faa
tail -30 protein.faa
tail protein.faa
head protein.faa
ls "ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete*protein.faa.gz"
sudo setfacl -R -m u:cperalta:rw README.axolotl
ssh UBMI01
getfacl README.axolotl
getfacl .
emac README.uniparc
cd /UBMInas/databases/uniprot/
ls /UBMInas/databases/uniprot/
wget -N --mirror "ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete*protein.faa.gz"
emac README.axolotl
cd ncbi_genomes/
ls /UBMInas/databases/ncbi_genomes/
mv AmexGv6_GeneModels.tab.gz /UBMInas/databases/ncbi_genomes/
last -1
zcat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.????.protein.faa.gz > protein.faa
rm protein.faa.gz
wget -N --mirror "ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/915/635/GCA_002915635.3_AmbMex60DD/"
cd  ncbi_genomes/
mkdir ncbi_genomes
cd /
cd -
man tr
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | tr '\n' '_'
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | tr '\n' ''
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | tr \n
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | tr
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | sed 's/\\n//'
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | sed 's/\n//'
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6 | sed 'g/\n//'
shuf -e a b c d e f g y a g h 2 4 6 1 32 4 6
shuf -e a b c d e
shuf telegram_speak.py
cat telegram_speak.py
shuf passwd
cat passwd
ls passwd
seq 3 23 | shuf
seq 3 23
seq 1 23
seq 23
zcat protein.faa.gz
gunzip -k protein.faa.gz
cat ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.????.protein.faa.gz > protein.faa.gz
cd /UBMInas/databases/RefSeq_protein/
pwd
ls protein.faa.gz
gunzip protein.faa.gz
setxkbmap -option ctrl:nocaps -layout us -variant altgr-intl
gunzip  -k protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.[0-9][4].protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.[0-9]{4}.protein.faa.gz
help expand
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.[0-9]?.protein.faa.gz
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.[0-9]*.protein.faa.gz
cd ../
cd ../../
cd Descargas/refseq/ftp.ncbi.nlm.nih.gov/refseq/release/complete/
ls Descargas/refseq/
watch ls -lh
ls -l
ls ftp.ncbi.nlm.nih.gov/refseq/release/complete/index.html
ls RefSeq_protein/ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.* | grep -v nonredundant
ls RefSeq_protein/ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete.*
ls RefSeq_protein/ftp.ncbi.nlm.nih.gov/refseq/release/complete/
scp RefSeq_protein/ftp.ncbi.nlm.nih.gov/refseq/release/complete/
scp RefSeq_protein/ftp.ncbi.nlm.nih.gov/refseq//release/complete/
cd ftp.ncbi.nlm.nih.gov/refseq/release/complete/
wget -N --mirror ftp://ftp.ncbi.nlm.nih.gov/refseq/release/complete/complete*protein.faa.gz
man wget
tldr wget
cd refseq/
mkdir refseq
ls ftp.ncbi.nlm.nih.gov/
cd RefSeq_protein/
c craspi/Utilities/split_fasta.py
less craspi/Utilities/split_fasta.py
ls craspi/Utilities/
ls craspi/
cd Dropbox/scripts/
scp RefSeq_protein/protein.faa tetis:~/
ls -hla RefSeq_protein/
ls -la RefSeq_protein/
ls refseq_protein.00.tar.gz
ssh tetis
man xrdp-dis
man xrdp-sesman
man xrdp
tldr xrdp
c /var/log/xrdp-sesman.log
ssh jarvis
ssh UBMI02
grep "access granted" /var/log/xrdp-sesman.log
grep "access granted" xrdp-sesman.log
c xrdp-sesman.log
grep "acces granted" xrdp-sesman.log
c xrdp.log
cd log/
ls log/
cd /var
ps -u  cperalta
ps -u  cperalta > grep htop
watch ps -u  cperalta > grep htop
watch ps -u  cperalta
who
last -10
sudo find / -name "*xrdp*"
ps -u  acph
ps -u  mprior
tldr ps
sudo ps -ax -u  cperalta
ps -ax -u  cperalta
ps -aux  cperalta
ps -aux -u cperalta
ps -a -u cperalta
ps -e -u cperalta
ps -u cperalta
man cperalta
ps -u acph
man ps
ps -a
ps
finger mprior
finger cperalta
sudo aptitude install finger
w
who w
last -30
ssh aleph
c mRNA_vs_mutType.txt
mv plot.png mRNA_vs_mutType.png
mv plot.txt mRNA_vs_mutType.txt
rm plot.txt
rm plot.png
mv plot.png mRNA_vs_Dx.png
mv plot.txt mRNA_vs_Dx.txt
mv plot.png fractionGenomeAltered_vs_Dx.png
mv plot.txt fractionGenomeAltered_vs_Dx.txt
rm plot\ \(1\).svg
mv plot.svg mutNumber_vs_Dx.svg
mv plot.txt mutNumber_vs_Dx.txt
c plot.txt
c legend_lolipop.txt
emac legend_lolipop.txt
emacs -nw -q ../.config/fish/
c mutations_kcnh1.tsv
emacs -nw -q ../.bashrc
mv table.tsv mutations_kcnh1.tsv
wc table.tsv
grep table.tsv
less -S table.tsv
python mail2all.py
nano passwdpru
cat passwdpru
python mailer.py credentials.gpg dragopoot@gmail.com 'Prueba' "# Prueba de texto
 con varios espacios y toda la __cosa__."
python mailer.py credentials.gpg dragopoot@gmail.com 'Prueba' gpg.md
python mailer.py credentials.gpg dragopoot@ifc.unam.mx 'Prueba' gpg.md
python mailer.py credentials.gpg dragopoot@ifc.unam.mx 'Prueba' "#Texto de prueba\n\n Sera _bueno_?"
less credentials
python mailer.py credentials dragopoot@ifc.unam.mx 'Prueba' "#Texto de prueba\n\n Sera _bueno_?"
python mailer.py
cat gpg.md
le gpg.md
ls *.md
cd Dropbox/UBMI/mail_login/
rm prueba.py
python prueba.py
nano prueba.py
python prueba.py --foo --bar
python prueba.py --bar
python prueba.py --foo
python prueba.py -h
cd pruebas/
ls-ltr
ssh -p 6112 UBMIportal
scp -P 6112 ruth.pdf  UBMIportal:~/
scp -P 6112 Transferencia\ Ricardo\ Castro.pdf  UBMIportal:~/
scp Transferencia\ Ricardo\ Castro.pdf -p 6112 UBMIportal:~/
scp Transferencia\ Ricardo\ Castro.pdf  UBMIportal:~/
cat Transferencia\ Ricardo\ Castro.pdf | ssh -p 6112 UBMIportal lp
cat Transferencia\ Ricardo\ Castro.pdf | ssh -p 6112 UBMIportal  lp
cat Transferencia\ Braulio\ Rodríguez.pdf | ssh -p 6112 UBMIportal lp
cat orden\ de\ cobro\ PAPIIT\ 04\ Lourdes\ Massieu.pdf | ssh -p 6112 UBMIportal lp
cat orden\ de\ cobro\ PAPIIT\ 03\ Jaime\ Mas.pdf | ssh -p 6112 UBMIportal lp
cat orden\ de\ cobro\ TRANSFERENCIA\ 02_Braulio\ Rodríguez.pdf | ssh -p 6112 UBMIportal lp
cat orden\ de\ cobro\ TRANSFERENCIA\ 01_Ricardo\ Castro.pdf | ssh -p 6112 UBMIportal lp
cat Cotización\ IFC-UI2_COT-06.pdf | ssh -p 6112 UBMIportal lp
l s-ltr
scp maggie:/etc/passwd passwd.maggie
scp maggie:/etc/group .
scp maggie:/etc/passwd .
orange-canvas
ipython --pylab
emacs mail2all.py &
less mail2all.py
ls *.py
batcat mailer.py
cd mail_login/
cd UBMI/
cd Dropbox/
ssh maggie
cal -3
cal
sudo aptitude install ncal
ncal
byobu
less -S genome_stats.txt
du -h . -d 0
cd dkegg/
ssh 3DGenome
ssh 3Dge
ssh 3D
ls acph/iso
ls acph/
ls backup/
ls backup/3dgenome_04_2022/
ls backup/mayra/
ls users/
cd /UBMInas
ls /UBMInas
ls /UBMInas00/
sudo mount ubminas00.local:/export/ubminas00_nfs /UBMInas00/
sudo mount 10.10.180.72:/void /UBMInas/
sudo mou
ssh-keygen -f "/home/acph/.ssh/known_hosts" -R "jarvis"
ssh ale
last -20
conda activate prueba
su - acph
sudo usermod -a -G dialout acph
conda install ipython
conda isntall ipython
conda create -n prueba pyserial
ls /dev/tty*
lsusb
sudo dmesg  |  grep /dev/tty
sudo dmesg  |  grep /dev
sudo dmesg  |  grep dev
sudo dmesg  | tail -20 | grep dev
sudo dmesg  | tail -20
sudo dmesg  | tail
ls -ltr /dev/ | tail
watch ls -ltr /dev/ | tail
watch ls -ltr /dev/
sudo dmesg
dmesg
conda search deap
scp -P 6112 mgen000790.pdf UBMIportal:~/
scp -p 6112 mgen000790.pdf UBMIportal:~/
cat mgen000790.pdf | ssh -p 6112 UBMIportal lp
cat mgen000790.pdf
ls -lt
dialog
tldr dialog
tldr ping
ping  -O tetis
ping maggie -O
ping aleph -O
ping maggie
less passwd
gpg -d gpg.md
sleep 500
ls mail2all.py
cd UBMI/mail_login/
mv test.py Dropbox/UBMI/mail_login/
mv \'test.py\' test.py
cat /etc/passwd
emacs mail_credentials.py
ssh aleph cat /etc/group
cp -r /storage/ respaldonuevo
ls /storage/
ls respaldo02
ls respaldo01/
rmdir 02/
rm 02/
ls 02/
cd /UBMInas00/
sudo moun
jupyter-notebook
su - seisbio
cp ../Dropbox/Cursos/ML-Neurociencias/usando_sklearn/Unidad_ML_Tarea_final.ipynb  .
conda search cuda
cibda se
tldr find
ssh amggie
sudo cat /root/.wget-hsts
sudo ls -la /root/.wget-hsts
sudo ls -la /root/.cache
sudo ls -la /root/.
sudo cat /root/.bash_history
sudo ls /root
comm -23 <(aptitude search '~i !~M' -F '%p' | sed "s/ *$//" | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

man comm
find  ftp.ensembl.org/  -name '*elegans*'
grep '@' passwd
grep -v 'nologin' passwd
grep 'nologin' passwd
set EDITOR emacs -nw -q ; export EDITOR
set EDITOR emacs -nw -q
history
hist
export EDITOR
emacs -nw -q
emacs -nw -quiet
emacs -nw --quiet
set EDITOR emacs -nw -quiet
ssh UBMI01 cat /etc/passwd > passwd
ssh UBMI01 cat /etc/passwd
batcat mail_credentials.py
lds
cdls
ls mail_login/
lsls mail_login/
ls UBMI/
ls Dropbox/
batcat test.py
cat pru.txt
less test.py
python test.py
batcat  test.py
cat test.py
git pull
cd hd-notify-users/
ls hd-notify-users/
cssh maggie aleph tetis 3DGenome UBMI01 UBMI02 UBMI03
maggie
tail -50  /var/log/syslog
tail -40  /var/log/syslog
head /var/log/syslog
tail /var/log/syslog
ls -lart /var/log
emacs -nw setxkbmap_notes.txt
cat setxkbmap_notes.txt
ls setxkbmap_notes.txt
cat xbindkeysrc.gerosxps
cd ../config/
cd Recibo\ de\ Pago\ de\ Tenencia-\ DGR_GEM-2019_files
man xkeyboard-config
setxkbmap -option ctrl:nocaps -layout us -variant intl
setxkbmap -option ctrl:nocaps -layout us -variant alt-intl
setxkbmap -query
setxkbmap -option ctrl:nocaps
ls acph_folder/
watch ls
rm -rf cperalta/
rmdir -rf cperalta/
rm hola_desde_alekhine
rm hola_ls!
ls hola_ls!
cd cperalta/
touch hola_desde_03
sudo umount -f /UBMInas00
rm UBMI03_
touch Hola
ls /UBMInas00
man umount
sudo umount /UBMInas00
ls UBMInas00
watch hola
rm hola
touch HOla
touch UBMI03_
cd PruebaMara/
getfacl
rm  Hola_desde_UBMI3
ls  -ltr
touch Hola_de_nuevo
ls Mara/
rm -rf Mara2/
ls Mara2/
cd /storage/
lls
conda activate nmjanalyser-env
sudo cp -r splitedimages /home/mprior/
sudo rm /home/mprior/splitedimages
sudo ln -s splitedimages /home/mprior/splitedimages
rm /home/mprior/splitedimages
ls /home/mprior/spl
ll
ls splitedimages
sudo ln  splitedimages /home/mprior/
sudo ln -s splitedimages /home/mprior/
nautilus .
feh maxprojpath/21-05-24/MP210301L\ BFi/R2_C7_20x_C_channel*
wc results1/ExtractedTableFinFilled_.csv
wc results/ExtractedTableFinFilled_.csv
wc results2/ExtractedTableFinFilled_.csv
wc results3/ExtractedTableFinFilled_.csv
wc results4/ExtractedTableFinFilled_.csv
set EDITOR emacs
echo $EDITOR
emacs xml_explore.py
conda search xmltodict
conda activate czi-env
batcat xml_explore.py
batcat getcorr.py
batcat viz_files.py
batcat create_splited_files.py
batcat create_maxproj.py
cd Dropbox/Maletin/czitools/
ls results4/ExtractedTableFinFilled_.csv
ls results4/
cp *.py /home/acph/Dropbox/Maletin/czitools/
mkdir /home/acph/Dropbox/Maletin/czitools
rm prueba.txt
cat prueba.txt
cat pru
rm PhyloAnalysis.mdsx
mv fany/ Proyectos/
ls igv/
ls data/
rmdir thinclient_drives/
ls -l thinclient_drives/
ls thinclient_drives/
rm thinclient_drives/
ls Proyectos/
ls pruebas
ls prueba
ls repos/
rm -rf Documents/Zoom/
ls Documents/Zoom/
ls Documents/
ls Documentos
ls Document
ls Isabel_Rosaura/
ld
cd Proyectos/
cd Maletin/
ls Maletin/
rm CHANGELOG.md
rm *.table
ls *.table
rm *.txt
ls *.txt
rm GSE37268_mof3.out.hpeak.txt
rm _GuiaAP-RRHH.pdf
evince _GuiaAP-RRHH.pdf
rm pro*
ls pro*
cat prot_FASTA_especies.txt
rm  *.doc
ls *.doc
rm LICENSE
rm *.bed
ls *.bed
rm arbolPromotores.mtsx
rm arbolCDS.mtsx
rm *.nwk
rm imager_1.7.1_amd64.deb
rm 2022-01-28-raspios-bullseye-arm64-lite.zip
rm vspace*
ls vspace*
rm -rf Eisvogel/
rm README.md
cat README.md
rm README
cat README
ls README
qls
cat *.md
feh .svg
rm *.jpg
feh *.jpg
rm  *.png
feh *.png
ls *.png
rm *.iso
ls *.iso
ls /UBMInas/iso/
rm MA0546.1.meme
ls Kcnh1_expression_cbioportal/
du -h Kcnh1_expression_cbioportal/
rm -rf examples/
ls examples/
rm acph.pdf
evince acph.pdf
feh acph.pdf
rm LISTADO\ DE\ EXISTENCIAS\ AL\ DIA\ 15\ DE\ MARZO\ DE\ 2022.xlsx
ls Eisvogel/
rm Texto*
ls Texto*
ls Descargas/
cat viz_files.py
rm servers.txt
rm users.sh.\~1\~
rm users.sh
bash users.sh
bash users.sh servers.txt
bg
bfg
emacs users.sh
ssh ubmi01 cat /etc/passwd
less servers.txt
nano servers.txt
mkdir results4
ls splitedimages/
ls splitedimages/21-05-24_MP210304L\ Gi_R2_C4_40x_C/
feh splitedimages/21-05-24_MP210304L\ Gi_R2_C4_40x_C/
feh splitedimages/21-05-24_MP210304L\ Gi_R2_C4_40x_C/R2_C4_40x_C_*.jpg
cd /storage/Mara
sudo passwd mprior
ls ../
sudo useradd -u 9901 -m -s /bin/bash -c "Mara Prior,mprior@ifc.unam.mx," mprior
ls -ltr /UBMInas00/prueba
ls -ltr /UBMInas00/
ssh ubmi02.local
python create_splited_files.py
rm -rf splitedimages
feh splitedimages/21-05-24_MP210301L\ BFi_R2_C7_20x_C/*.jpg
ls splitedimages/21-05-24_MP210301L\ BFi_R2_C7_20x_C/
rm splitedimages
ls splitedimages/21-05-24_MP210301L\ BFi/
ls splitedimages2/
emacs create_splited_files.py &
rm *.nii
ls *.nii
feh Green_.nii
less Green_.nii
gunzip -k LabelsFilled.nii.gz
gunzip -k Green_.nii.gz
cd results2/
ls results3/
cat results3/threshold.txt
ls results3/threshold.txt
echo 'Threshold = 150' > results3/threshold.txt
ls results2/
ls splitedimages2
du -d 1 -h splitedimages
time rsync -avhP /storage/Mara2/*.zip mara_datos/
time rsync -avhP /storage/Mara2/*.zip mara_datos/ -n
du -h  mara_datos/
ls -ltr mara_datos/
ls mara_datos/
time rsync -avhP /storage/Mara/*.zip mara_datos/
time ls
timeit ls
rsync -avhP /storage/Mara/*.zip mara_datos/
tldr rsync
man rsync
rsync -v -mirror /storage/Mara/*.zip mara_datos/
rsync -mirror /storage/Mara/*.zip mara_datos/
rsync -mirror /storage/Mara/*.zip mara_datos/ -n
rsync -mirror /storage/Mara/*.zip . -n
rsync --mirror /storage/Mara/*.zip . -n
mkdir mara_datos
cd acph_folder
mkdir acph_folder
echo "Texto de prueba con un gran saludo" > HolaCarlos
less prueba
touch prueba
cd /UBMInas00
sudo mount ubminas00:/export/ubminas00_nfs /UBMInas00/
sudo mkdir /UBMInas00
ls /UBMInas/
ls /mnt/
sudo rmdir /mnt/nube/
ls /mnt/nube/
ssh ubminas00.local
ssh ubminas00
ssh 10.10.180.204
ping nube.local
sudo umount /mnt/nube
sudo mkdir acph
mkdir acph
cd nube/
umount /mnt/nube
cd /mnt/nube/
sudo mount nube.local:/export/nube_nfs /mnt/nube/
sudo mkdir /mnt/nube
sudo umount /mnt
sudo touch acph
sudo ls
touch acph
cd /mnt
rmdir acph
drf -h
sudo mount nube.local:/export/nube_nfs /mnt
sudo mount nube.local:/nube_nfs /mnt
ssh acph@nube.local
less -S results3/ExtractedTableFinFilled_.csv
mv ultimo.fasta exon1.fasta
emacs ultimo.fasta
cd fany/
feh splitedimages2/*.jpg
rm *
cd results3/
cd results3/ExtractedTableFinFilled_.csv
aptitude search backup
nmj_analyzer
nmj_analyzer -p splitedimages2 -dx 0.48 -dz 1.75 -t 64 results3/
nmj_analyzer -p splitedimages2 -dx 0.48 -dz 1.75 -t 64
feh splitedimages2/*
feh splitedimages/*RED*
ls splitedimages/*RED*
du splitedimages/ -h
du splitedimages/
ls splitedimages/ | wc
less results3/
nmj_analyzer mkdir results3
nmj_analyzer --help
nmj_analyzer -h
conda activate  nmjanalyser-env
cd /storage/Mara/
less -S ExtractedTableFinFilled_.csv
wc ExtractedTableFinFilled_.csv
cd Mara
fg
conda deactivate
rm Green_.nii
rm -rf splitedimages2
jobs
kill %4
rmdir prueba/
rm prueba/
ls prueba/
fg %2
fg 2
less
less splitedimages/
mkdir results2
rm splitedimages2
cd ~/repos/
mkdir results
feh Image_sample/*.jpg
ls Image_sample/
nautilus . &
less Readme.rtf
feh 295B.lsm
less 295B.lsm
cd MouseTest_sample/
ls MouseTest_sample/
unzip MouseTest_sample.zip
cd NMJ_Analyser/
git clone https://github.com/csudre/NMJ_Analyser.git
rm -rf splitedimages2/
nmj_analyzer -z
ls -hltr splitedimages/
ls -ltr splitedimages/
feh splitedimages/*RED*.png
feh splitedimages/*GREEN*.png
feh splitedimages/*.png
ls -ltr /home/acph/
ls /home/acph/
ls resul
ls -hltr /var/www/html/
ls -ltr /var/www/html/
ls /var/www/html/
ls /var/www/
sudo mv maxprojpath_mara2.zip /var/www/html/
ls ../Mara
ls ../mara
mv maxprojpath.zip maxprojpath_mara2.zip
mv maxprojpath_mara2.zip
feh maxprojpath/21-05-24/MP210301L\ BFi/*.png
ls maxprojpath/21-05-24/MP210301L\ BFi/
ls maxprojpath/
cat correlation_intersection.czv
cat filed.txt
ls filed.txt
python getcorr.py
sudo aptitude install treeview treeviewx
aptitude search treeview
python create_maxproj.py
ln -s ../Mara/create_splited_files.py .
ln -s ../Mara/create_maxproj.py  .
ln -s ../Mara/getcorr.py .
rm -rf splitedimages/
for F in ls *.zip
echo 'Working with '$F
unzip $F -d (basename $F .zip)

end

for F in ls *.zip
echo 'Working with '$F
set NAME (basename $F .zip)
echo $NAME
end

for F in ls *.zip
echo 'Working with '$F
set NAME `basename $F .zip`
echo $NAME
end

for F in ls *.zip
echo 'Working with '$F
set NAME basename $F .zip
echo $NAME
end

for F in ls *.zip
echo 'Working with '$F
set NAME basename $F .zip
echo $NAME[2]
end

for F in ls *.zip
echo 'Working with '$F
set NAME basename $F .zip
echo $NAME[1]
end

for F in ls *.zip
echo 'Working with '$F
set NAME basename $F .zip
echo $NAME[0]
end

for F in ls *.zip

set NAME basename $F .zip
echo $NAME
end

basename $F .zip
basename $F
echo $F
for F in ls *.zip
echo 'Working with '$F
NAME=basename $F .zip
echo $NAME
end


for F in ls *.zip
echo 'Working with '$F
NAME=`basename $F .zip`
echo $NAME
end

for F in ls *.zip
echo $F
end
basename 21-05-24.zip .zip
tldr basename
man basename
basename 21-05-24.zip
man unzip
rm -rf MP*
ls MP*
ls MP210301L*
unzip 21-05-24.zip
unzip *.zip
unzip *
tldr unzip
cd /storage/Mara2/
emacs create_maxproj.py &
cat /etc/hosts
grep '>' * -c
grep '>' *
mv ../Descargas/codificante_FASTA_especies.txt codificatne.fasta
ls -ltr ../Descargas/
ls ../Descargas/
mv ../Descargas/*.fasta .
mkdir fany
rm *csv*
ls *csv*
rm  *.fasta*
ls *.fasta*
ls *
ls *.fasta
rm  *.fasta
rm maxprojpath.zip
ls -lh maxprojpath.zip
ls -ltr maxprojpath.zip
rm juicer_tools_1.22.01.jar
cd html/
sudo mv maxprojpath.zip html/
mv maxprojpath.zip html/
cd /var/www/
ls /var/
sudo mv  maxprojpath.zip /var/www/
sudo aptitude install apache2
nautilus maxprojpath/
sudo rm -rf juicer/
rm -rf juicer/
conda info -e
sudo mkdir restriction_sites
sudo mkdir references
sudo mkdir scripts
ls -ltr ..
ls work/
sudo chmod go+w work
sudo mkdir work
rm -rf maxprojpath/
rm prueba.tiff
rm prueba.png
rm prueba
rm fasfd
touch fasfd
cd juicer/tmp/
ls juicer/tmp/
ls juicer/
cd /opt/
sudo chmod go+w /opt/juicer/tmp/
sudo chmod go-w /opt/juicer/
sudo chmod uo+w /opt/juicer/
sudo chmod uo-w /opt/juicer/
ls -ltr /opt/
ls -ltr /opt/juicer/
sudo chmod uo+w /opt/juicer/tmp
ls -ltr /opt/juicer/tmp
sudo mkdir /opt/juicer/tmp -p
ls /opt/
ls /opt
aptitude search jdk
aptitude search jre
aptitude show build-essential
nemo .
beni ,
ssh UBMIportal -p 6112
emacs getcorr.py &
rm filed.txt
rm correlation_intersection.czv
batcat correlation_intersection.czv
less correlation_intersection.czv
sudo apt full-upgrade
sudo apt update
localectl list-x11-keymap-layouts
localectl list-x11-keymap-variants en
ss
ssh-copy-id 3DGenome
ssh-keygen -f "/home/acph/.ssh/known_hosts" -R "3dgenome"
paste
ssh UBMIportal
ls viz_files.py
cd Mara/
cd /data/
ssh 10.10.180.207
ssh 10.10.70.233
ssh
emacs hicplotter.sh
conda search -c bioconda -c conda-forge hicplotter
evince Instructivos/remote_jupyter/remote_jupyter.pdf
ls Instructivos/remote_jupyter/
ls Instructivos/
ls Estudiantes_SS/
emacs hic_breakfinder.log
batcat hic_breakfinder.log
cat hic_breakfinder.log
ls *plot*
ls *plott*
ls *hic*
ls hic_breakfinder.log
aptitude search pipewire
aptitude search pulseaudio
ls ..
sudo update
cat jarvis_mock.csv
cat prupandoc.py
ls prupandoc.py
cat ubmi_nuevo_usuario.md
cd ubmi_nuevo_usuario.md
ls ubmi_nuevo_usuario.md
less eisvogel.latex
scp uniparc_active.fasta.gz tetis:
scp uniprot_trembl.fasta.gz tetis:
ssh tetis  ls
scp uniprot_sprot.fasta.gz tetis:
rm RELEASE.metalink
rm QNAPQfinderProUbuntux64-7.7.0.1407.deb
ssh 3DBackup
man e2fsck
man fsck
lsblk
ssh UBMI01 free -h
ssh alekhine
git commit -m "Some modifications"
git diff
mamba install xmltodict
sshfs ubmi01:/ ubmic/ubmi01
sshfs
less xml_explore.py
emacs czitools.py
cd repos/czitools/
emacs &
conda activate czitools-env
batcat ~/repos/czitools/czitools.py
less ~/repos/czitools/czitools.py
ls ~/repos/czitools/scripts/
ln -s ~/repos/czitools/czitools.py .
rm -rf __pycache__/
ls oldscripts/
mv *.txt oldscripts/
mv *.py oldscripts/
mkdir oldscripts
batcat czi.py
batcat processall.py
batcat results.txt
c
nano ~/.config/fish/config.fish
cat ~/.config/fish/config.fish
cat ~/.config/fish/fish_variables
ct ~/.config/fish/config.fish
ls ~/.config/fish/config.fish
ls ~/.config/fish/
less processall.py
ls processall.py
d
cd czitools/
gh repo clone UBMI-IFC/czitools
ls ~/repos/
less czi.py
ls czi.py
mamba activate czi-env
mamba create -n czi-env -c bioconda -c conda-forge czifile scikit-image jupyter ipython seaborn
mamba create -n czi-env -c bioconda -c condaforge czifile scikit-image jupyter ipython seaborn
fusermount -u /home/acph/ubmic/ubmi01
mamba search image
mamba search skimage
mamba search sciimage
mamba search scikit-iamge
mamba search tk
mamba search tkinter
mamba search nibabel
sudo aptitude install hfsplus
aptitude search hfs
sudo fdisk -l
du -d 1 -h .
mamba search tinker
mamba search pillow
mamba install inquirer
head test.py
mamba search iniquerie
gh repo clone UBMI-IFC/hd-notify-users
gh repo list UBIM-IFC/
gh repo list UBIM_IFC/
gh repo list UBIM_IFC
gh repo list UBIM-IFC
gh repo list acpooth
gh auth login
bash
cd repos
tree mini_speech_commands/
du -d 0 -h mini_speech_commands/
ffplay 1b4c9b89_nohash_1.wav
ffplay 00b01445_nohash_0.wav 1b4c9b89_nohash_1.wav
ffplay 00b01445_nohash_0.wav
sudo aptitude install ffmpeg
sudo aptitude install ffplay
cd left/
ls left/
cd data/mini_speech_commands
ls data/mini_speech_commands
;
batcat test_cpu_gpu.py
conda search tensorflow-examples
emacs -nw test_keras_text.py
su -s seisbio
conda search tensorflow-datasets
conda search tensorflow
conda search tensorflow_examples
su
python test_cpu_gpu.py
cd jar
scp test_cpu_gpu.py jarvis:~/
ssh UBMI02 ls
ssh-copy-id jarvis
sudo nano /etc/hosts
ssh ubmi02
ssh 10.10.215.27
ssh-copy-id 10.10.215.27
jupyter
zcat Mus_musculus.GRCm38.dna_sm.toplevel.fa.gz | grep '>' | less
grep '>' Mus_musculus.GRCm38.dna_sm.toplevel.fa.gz
cd /UBMInas/databases/ftp.ensembl.org/pub/release-96//fasta//mus_musculus/dna/
python mail_credentials.py jarvis_users_noFCA.csv
batcat jarvis_users_noFCA.csv.\~1\~
pandoc ubmi_nuevo_usuario_templete.md -f gfm --template eisvogel -o prueba.pdf --listings
evince prueba.pdf
b
python mail_credentials.py jarvis_mock.csv
batcat jarvis_mock.csv
pandoc ubmi_nuevo_usuario_templete.md -f gfm -o prueba.pdf --listings
pandoc ubmi_nuevo_usuario_templete.md -f gdf  -o prueba.pdf --listings
pandoc ubmi_nuevo_usuario_templete.md -o prueba.pdf --listings
emacs -nw ubmi_nuevo_usuario.md
okular prueba.pdf
pandoc ubmi_nuevo_usuario.md --template eisvogel --listings -o prueba.pdf
pandoc ubmi_nuevo_usuario.md  --listings -o prueba.pdf
pandoc ubmi_nuevo_usuario.md --template eisvogel -o prueba.pdf
python mail_credentials.py
emacs mail_credentials.py &
sudo aptitude install texlive-full -y
pandoc ubmi_nuevo_usuario.md --template eisvogel-o prueba.pdf
cd ~/Dropbox/UBMI/mail_login/
cp eisvogel.latex ../../.pandoc/templates
mkdir -p ../../.pandoc/templates
ks ,
rm eisvogel.latex
cp eisvogel.latex ~/Dropbox/UBMI/mail_login/
feh icon.png
tar -zxvf Eisvogel.tar.gz
mv ../Eisvogel.tar.gz .
cd Eisvogel/
mkdir  Eisvogel
mkdir  Eisvogel.tar.gz
ls Eisvogel.tar.gz
cd ~/Descargas/
rm *.pdf
ls *.pdf
okular augusto.pdf
okular pru.pdf
pandoc ubmi_nuevo_usuario.md -f gfm -o prueba.pdf
pandoc -h | grep '\-f'
pandoc -h | grep 'f'
pandoc -h | grep '-f'
pandoc -h | grep -f
pandoc -h
pandoc
man pandoc
ssh 10.10.70.283
sudo aptitude install texlive-science -y
sudo aptitude isntall texlive-science -y
ping www.google.com
ping
less augusto.pdf
python prupandoc.py
cat ubmi_nuevo_usuario_templete.md
bf
bgf
pandoc ubmi_nuevo_usuario.md -o pru.pdf
sudo aptitude install texlive texlive-extra-utils
tldr pandoc
pandoc ubmi_nuevo_usuario.md
manpandoc
ssh-keygen -f "/home/acph/.ssh/known_hosts" -R "10.10.215.27"
emacs ubmi_nuevo_usuario.md
mv ~/Descargas/ubmi_nuevo_usuario.md .
man chpasswd
chpasswd
ls ~/repos/Documentos-IFC/
mv .\]  gmail.py
ls -a
mv ../gmail_phyton.py .
mv ../gmail_phyton.py .]
mkdir mail_login
rm -r passwd_email/
mv passwd_email/
mkdir passwd_email
cd Dropbox/UBMI/
rsync -av  UBMI01:~/.emacs.d/ .emacs.d/
rsync -av -n UBMI01:~/.emacs.d/ .emacs.d/
rsync -av  UBMI01:~/.emacs.d/ .emacs.d/ | less
rsync -av -n UBMI01:~/.emacs.d/ .emacs.d/ | less
rsync -a -n UBMI01:~/.emacs.d/ .emacs.d/
scp -r UBMI01:~/.emacs.d/* .emacs.d/
ls .emacs.d/
ssh UBMI01 ls .emacs.d/
ssh UBMI01 ls
ping aleph
ls logs/
find . -name '*mail*'
find . -name '*name*'
rm  *\~*
ls *\~*
sudo mo
systemctl reboot -i
systemctl reboot -ie
systemctl reboot
sudo aptitude upgrade
sudo aptitude update
ssh 10.10.180.36
ssh UBIM01
cd PA01_bacateria/
ls PA01_bacateria/
cd /UBMInas/acph/eprueda/
rm Lineamientos_uso_servidores.md\~
nautilus
emacs Lineamientos_uso_servidores.md
cd Lineamientos_uso_servidores/
mv Lineamientos Lineamientos_uso_servidores
cd Lineamientos/
cd Documentos-IFC/
aptitude search freerdp
ssh 10.10.180.78
aptitude search krdc
aptitude search rdesktop
aptitude search identifix
aptitude search anydesk
echo $LC_MEASUREMENT
cat startwm.sh
batcat xrdp_keyboard.ini
ls xrdp_keyboard.ini
batcat xrdp.ini
cat xrdp.ini
ls xrdp.ini
cat reconnectwm.sh
ls reconnectwm.sh
ls startwm.sh
cd /etc/xrdp/
ls /etc/xrdp/
batcat /etc/xrdp/startwm.sh
systemctl  status xrdp.service
iptables
ufw
cat /etc/xrdp/startwm.sh
sed '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh
man sed
/man sed
sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n'
sudo aptitude install xrdp
sudo aptitude remove tigervnc-standalone-server
aptitude search xrdp
remmina --full-version
remmina
sudo aptitude install tigervnc-standalone-server
feh ubmi01.png
cd Imágenes/
git commit -m "Agregando templete de aviso de privacidad"
git config --global user.name "Augusto César Poot Hernandez"
git config --global user.email "dragopoor@gmail.com"
lsd
mv Aviso_de_privacidad..md Aviso_de_privacidad.md
mv Aviso\ de\ privacidad..md Aviso_de_privacidad..md
mv ~/Documentos/Aviso\ de\ privacidad..md .
cd Aviso_de_privacidad/
mkdir Aviso_de_privacidad
git clone git@github.com:UBMI-IFC/Documentos-IFC.git
scp -P 6112 Telegram_canal.pdf acph@132.248.16.17:~
scp -p 6112 Telegram_canal.pdf acph@132.248.16.17:~
scp Telegram_canal.pdf -p 6112 acph@132.248.16.17:~
scp Telegram_canal.pdf -p 6112 acph@132.248.16.17
cd Documentos
cd Document
feh pru.png
qrencode -s 15 -l H -o pru.png https://t.me/+Dj265mRkFAliOWUx
man qrencode
qrencode -s 15 -o pru.png https://t.me/+Dj265mRkFAliOWUx
qrencode -s 30 -o pru.png https://t.me/+Dj265mRkFAliOWUx
qrencode -o pru.png https://t.me/+Dj265mRkFAliOWUx
qrencode -o pru.png 'https://t.me/+Dj265mRkFAliOWUx'
less all_samples.narrowPeak
cat all_samples.narrowPeak
igv
conda activate igv-eng
mamba activate igv-eng
mamba create -n igv-eng -c bioconda -c conda-forge igv
ls users/emucino/GRACIAS_Doc/
ls users/emucino/
cd /UBMInas/
ls ../../storage/Data/
ls ../../storage/
cd ../../home/acph/
ls ../vbox/
ls Enoch/
ls Abraham/
ls eprueda/
cd Data/
cd storage/
ls storage/
cd ubmi01/
ls ubmi01/
ls ubmi02/
fusermount -u /home/acph/ubmic/ubmi02
ls ubmi02
cd ubmic/
ls ubmic/
qrencode -o pru.png 'https://t.me/+Dj265mRkFAliOWUx  qr1'
qrencode https://t.me/+Dj265mRkFAliOWUx  qr1
qrencode https://t.me/+Dj265mRkFAliOWUx -f qr1
qrencode https://t.me/+Dj265mRkFAliOWUx
sudo aptitude install qrencode
aptitude search grencode
sudo aptihttps://t.me/+Dj265mRkFAliOWUxhttps://t.me/+Dj265mRkFAliOWUxtude install grencode
sudo aptitude install grencode
aptitude search tigervnc
aptitude search vnc-server
vnc
aptitude search vnc
aptitude search rdp
sudo nano  /etc/apt/sources.list.d/rock-core-ubuntu-qt4-impish.list
ls /etc/apt/sources.list.d/
ls /etc/apt/sources.list
aptitude search remmina
systemctl status
systemctl list
sudo aptitude install remmina
sudo aptitude isntall remmina remmina-plugin-vnc remmina-plugin-www
aptitude search libqtgui4
aptitude search libssl
fish
sudo add-apt-repository ppa:rock-core/qt4
conda remove -n prueba2 --all
conda remove -n prueba --all
conda env export
conda env export prueba
R
conda activate prueba2
mamba create -n prueba2 -c bioconda -c conda-forge r=3 bioconductor-deseq2 bioconductor-edger bioconductor-diffbind
r
conda  activate r-base
mamba activate r-base
mamba create -n prueba -c bioconda -c conda-forge bioconductor-deseq2 bioconductor-edger bioconductor-diffbind
mamba install -c bioconda -c conda-forge bioconductor-deseq2 bioconductor-edger bioconductor-diffbind
conda search -c bioconda -c conda-forge bioconductor-deseq2 bioconductor-edger bioconductor-diffbind
mamba create -n r-base r=4
conda create -n r-base r=4
conda search -c bioconda diffbind
conda search -c bioconda deseq
conda search -c bioconda edger
batcat *
batcat rock-core-ubuntu-qt4-impish.list
uname -a
cat system.sources
cat google-chrome.list
sudo rm rock-core-ubuntu-qt4-impish.list
sudo nano rock-core-ubuntu-qt4-impish.list
man sources.list
man apt-secure
sudo add-apt-repository ppa:rock-core/qt4
sudo apt-get update
sudo rm -rf gezakovacs-ubuntu-ppa-impish.list
rm -rf gezakovacs-ubuntu-ppa-impish.list
cd /etc/apt/sources.list.d/
cat /etc/apt/sources.list.d/gezakovacs-ubuntu-ppa-impish.list
ls /etc/apt/sources.list.d/gezakovacs-ubuntu-ppa-impish.list
less /etc/apt/sources.list.d/
less /etc/apt/sources.list
batcat /etc/apt/sources.list
man add-apt-repository
sudo add-apt-repository ppa:gezakovacs/ppa
wc plot.txt plot\ \(1\).txt
diff plot.txt plot\ \(1\).txt
find . -mtime -4 -type f -name '*'
find . -mtime -4 -type f -name '*' -exec rm {}  \;
find . -mtime -4 -type f -name '*' -exec cp {} Kcnh1_expression_cbioportal/ \;
mkdir Kcnh1_expression_cbioportal
rm resumen\ gtex\ cambios_acph.docx
find . -mtime -4 -type f -name '*' | head
find . -mtime -6 -type f -name '*' | head
find . -mtime -6 -type f -name '*'
find . -mtime -6 -type f -name '*.JPG'
find . -mtime -5 -type f -name '*.JPG'
find . -mtime -4 -type f -name '*.JPG'
find . -mtime -2 -type f -name '*.JPG'
ssh seisbio@UBMI02
ssh seisbio@UBMI01
ssh seisbio@ubmi02
conda create -n diffbind-env -c bioconda -c conda-forge bioconductor-diffbind
conda create -n diffbind-env -c bioconductor -c conda-forge bioconductor-diffbind
scp -r Dropbox/UBMI/SEISbio/  UBMI02:
ChIP-seq --local --DAG -d map_test_dedup_mapq pf3d7 chip.txt
bpytop
sensors
sensros
ChIP-seq --local --DAG -d map_test pf3d7 chip.txt
conda activate snakePipes
DNA-mapping --local --j 20 --ext '.fq.gz' --reads '_1' '_2' -i rawdata/ --dedup --mapq 3 -o map_test_dedup_mapq pf3d7
ls rawdata/
mv rawdata/chip.txt .
rm \#chip.txt\#
rm chip.txt\~
rn chip.txt\~
emacs -nw chip.txt
nano chip.txt
cd /storage/rawdata/
ChIP-seq
DNA-mapping --local --j 20 --ext '.fq.gz' --reads '_1' '_2' -i rawdata/ -o map_test pf3d7
ls /data/
sudo chmod 777  /data/
sudo chmod 777  /data/extended
ls /data/extended
sudo mkdir -p /data/extended
DNA-mapping --local --j 20 --ext '.fq.gz' --reads '_1' '_2' -i rawdata/ -o map_test pdf3d7
cat ubmic/ubmi02/hhd_data/isabel_data/comandos_snakePipes
cp -r ubmic/ubmi02/hhd_data/isabel_data/rawdata/ /storage/
ls ubmic/ubmi02/hhd_data/isabel_data/rawdata/
ls ubmic/ubmi02/hhd_data/isabel_data/
ls ubmic/ubmi02/hhd_data/isabel_data/input_referencia/
ls ubmic/ubmi02/hhd_data/
ls ubmic/ubmi02/
head ubmic/ubmi02/home/seisbio/data/snakePipes/pf3d7/createIndices_run-1.log
cat ubmic/ubmi02/home/seisbio/data/snakePipes/pf3d7/createIndices_run-1.log
ls ubmic/ubmi02/home/seisbio/data/snakePipes/pf3d7/createIndices_run-1.log
ls ubmic/ubmi02/home/seisbio/data/snakePipes/pf3d7/
ls ubmic/ubmi02/home/seisbio/data/snakePipes/
ls ubmic/ubmi02/home/seisbio/data/
cat ubmic/ubmi02/home/seisbio/data/
cat ubmic/ubmi02/home/seisbio/comando_crearindices.sh
ls ubmic/ubmi02/home/seisbio/comando_crearindices.sh
ls ubmic/ubmi02/home/seisbio/
cp -r ubmic/ubmi02/home/seisbio/
cp -r ubmic/ubmi02/hhd_data/databases/ /storage/
ls -ltr /
sudo chmod og+w /storage/
sudo chmod og+x /storage/
sudo chmod u+x /storage/
ls -ltr /storage/
ls ubmic/ubmi02/hhd_data/databases/
ls ubmic/ubmi02
sshfs ubmi02:/ ubmic/ubmi02
byoibu
mogrify *.png -resize 20%
convert cerebro.png -resize 20% cerebro_chiquito.png
ssh acph@10.10.180.36
ssh -p 6112 acph@132.248.16.17
rm -rf prueba
ssh acph@10.10.180.37 ls
scp Paramover acph@10.10.180.37:/home/acph
ls adentro/
cp adentro/Paramover .
touch Paramover
cd adentro/
mkdir adentro
cd prueba
mkdir prueba
spyder
eog prueba.png
emacs prueba.py
sshf
ssh pi@10.10.180.40
cd Dropbox/Maletin/
hostname -I
sudo touch ssh
ssh 10.10.180.40
sudo emacs dhcpcd.conf
emacs dhcpcd.conf
cat dhcpcd.conf
ls dhcpcd.conf
ssh drone@10.10.214.71
ssh 10.10.214.71
cd ubmic/ubmi01/
emacs main.py &
bokeh serve  main.py --address 10.10.180.38 --port 5006 --allow-websocket-origin='*'
panel serve main_holoviews.py --show
panel serve main_holoviews.py
panel serve --address 10.10.180.38 --show
panel serve --address 10.10.180.38 --port 5006 --allow-websocket-origin='*' main_holoviews.py
panel serve  main_holoviews.py --address 10.10.180.38 --port 5006 --allow-websocket-origin='*'
panel serve  main.py --address 10.10.180.38 --port 5006 --allow-websocket-origin='*'
cd bokhe_pru/
bokeh serve --show main.py --address 10.10.180.38 --port 5006 --allow-websocket-origin='*'
panel serve --show main_holoviews.py
bokeh serve --show main.py
lx
cd bacteria_fastas/
ls bacteria_fastas/
cd eprueda/
ks .
cd acph/
free -h
last
cssh
cd home/acph/Documents/
sshfs ubmi01:/ ubmi01/
ls ubmi01
less -S .ssh/authorized_keys
cat .ssh/authorized_keys
catr .ssh/authorized_keys
ls .ssh/authorized_keys
ls .ssh/
sudo lshw -C display
emacs test_cpu_gpu.py &
nvidia-smi
aptitude search nvidia | grep 510
aptitude search nvidia
python3
python
conda list | grep nn
conda list | grep cnn
conda list | grep cuda
aptitude search cuda
sudo aptitude install nvidia-headless-510
sudo aptitude isntall nvidia-headless-510
rm test_gpu_cpu.py
cat test_gpu_cpu.py
cat test_
cat test_cpu_gpu.py
scp test_cpu_gpu.py  UBMI01:
rm  ubmic/ubmi01/test_cpu_gpu.py
ls  ubmic/ubmi01/
cp test_cpu_gpu.py  ubmic/ubmi01/
s
cat \#test_cpu_gpu.py\#
rm -rf .emacs.d/
ls ubmic/ubmi01/home/acph/.emacs.d/
cp -r  ubmic/ubmi01/home/acph/.emacs.d/ .
cp  ubmic/ubmi01/home/acph/.emacs.d/ .
fusermount -u /home/acph/ubmic/maggie
ls ubmic/maggie
fuser -u ubmic/ubmi01
ls ubmic/ubmi01/
set
guake
jupyter-lab
setxk
ls /ub
find . -mtime -2 -type f -name '*.JPG' -exec rm {} \;
find . -mtime -1 -type f -name '*.JPG'
man find
find . -mtime +1 -type f -name '*.JPG'
find . -mtime +1 -type f -name '*.jpg'
find . -mtime +1 -type f
ls -ltr  *.JPG
ls  *.JPG
ls *.JPG
ls *.jpg
head mm9.RefSeq_genes_from_UCSC.bed
head rnor6_ucsc_refseq_modificado.bed
mv Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular rnor6_ucsc.table
cut -f 13 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular | less
cut -f 15 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular | less
cut -f 14 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular | less
cut -f 14 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular
head 1 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular | sed 's/\t/\n/g' | nl
head 1 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular | sed 's/\t/\n/g' | ln
head 1 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular | sed 's/\t/\n/g'
head 1 Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular
less -S Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular
head -S Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular
head Galaxy74-\[UCSC_Main_on_Rat__ncbiRefSeq_\(genome\)\].tabular
cut -f 5 mm9.RefSeq_genes_from_UCSC.bed | sort | uniq
cut -f 5 mm9.RefSeq_genes_from_UCSC.bed
cut -f 4 mm9.RefSeq_genes_from_UCSC.bed
cut -f 3 mm9.RefSeq_genes_from_UCSC.bed
cut -f 2 mm9.RefSeq_genes_from_UCSC.bed
less mm9.RefSeq_genes_from_UCSC.bed
cat mm9.RefSeq_genes_from_UCSC.bed
ssh-copy-id -p 6112 UBMIportal
man ssh-copy-id
ssh-copy-id UBMIportal  -p 6112
ssh-copy-id UBMI03
ssh-copy-id UBMI02
ssh-copy-id UBMI01
ssh-copy-id tetis
ssh-copy-id maggie
ssh-copy-id aleph
man fish
help
sudo apt install clusterssh
ssh-keygen -t rsa -C "another brick in the wall"
ls prueba.txt
mv prueba.py  prueba.txt
free > prueba.py
free
jupyter notebook
cd ad29b53188a325d9e8910b76783eac02-373c6af6c8e62b992d7a09fbb6a7c89006742039
ls ad29b53188a325d9e8910b76783eac02-373c6af6c8e62b992d7a09fbb6a7c89006742039
mv ad29b53188a325d9e8910b76783eac02-373c6af6c8e62b992d7a09fbb6a7c89006742039
unzip ad29b53188a325d9e8910b76783eac02-373c6af6c8e62b992d7a09fbb6a7c89006742039.zip
singularity
cd la
mamba install tensorflow-gpu
conda install tensorflow-gpu
conda search tensorflow-gpu
conda list
ls /usr/local/share/
ls /usr/local/share/cowsay-files/
ls /usr/local/share/cowsay-files/cowrc.sh
less /usr/local/share/cowsay-files/cowrc.sh
cowsay -f cowsay-files/cows/pikachu.cow  Byyyy
cowsay -f cowsay-files/cows/cthulhu.cow  Byyyy
cowsay cowsay-files/cows/cthulhu.cow  Byyyy
git clone https://github.com/paulkaefer/cowsay-files
cowsay -f turtle Buuuu
cowsay -f tux Buuuu
cowsay -l
cowsay -f apt Buuuu
cowsay -f bunny Buuuu
man cowsay
cowsay -f
cowsay
cowsay  ven
emacs telegram_speak.py &
python telegram_speak.py 'Esto es una prueba '
ps |  python telegram_speak.py
sl
nvidia-smi |  python telegram_speak.py
ls |  python telegram_speak.py
cowsay "ven!!!" | python telegram_speak.py
cowsay "F\$%_=+k servicios de paga" | python telegram_speak.py
cowsay hi | python telegram_speak.py
cowsay hi
sudo aptitude install cowsay
aptitude search cow
sudo aptitude install lolcow
date | figlet | python telegram_speak.py
man watch
date | python telegram_speak.py
watch date | figlet | python telegram_speak.py
watch python telegram_speak.py < `date | figlet`
watch python telegram_speak.py < date | figlet
date | figlet
rm figlet
date
date > figlet
sudo aptitude install figlet
sudo aptitude isntall figlet
aptitude isntall figlet
nv
ps -e
ps -A
python telegram_speak.py 'El problema es meter cadenas de caractes con comillas cuando ya tienes comillas dobles o secillas... eso si lo se hacer con python'
python telegram_speak.py 'El de bash no funcionó :S'
python telegram_speak.py 'Me tarde más en tratar de arreglar el script de bash que en escribir uno en python'
python telegram_speak.py 'una prueba más'
bash telegram_speak.sh 'Una prueba de caracter'
curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "-755156396", "text": "Aqui trabajando :P", "disable_notification": true}}' https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/sendMessage
bash telegram_speak.sh "Una prueba de caracter"
bash telegram_speak.sh solo prueba
emacs telegram_speak.sh
bash telegram_speak.sh solo prueba pruieba
sudo aptitude install lm-sensors
aptitude install lm-sensors
curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "-755156396", "text": "HOLA DESDE LA LINEA DE COMANDOS", "disable_notification": true}}' https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/sendMessage
curl https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/getUpdates | grep chat
curl https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/getUpdates
curl https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/getUpdates | jq .message.chat.id
curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "755156396", "text": "HOLA DESDE LA LINEA DE COMANDOS", "disable_notification": true}}' https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/sendMessage
curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "g755156396", "text": "HOLA DESDE LA LINEA DE COMANDOS", "disable_notification": true}}' https://api.telegram.org/bot5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/sendMessage
curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "g755156396", "text": "HOLA DESDE LA LINEA DE COMANDOS", "disable_notification": true}}' https://api.telegram.org/bot$5201215588:AAHw72uB5QlhTcEw81c23Sn74qmUb_gZfLs/sendMessage
conda search -c bioconda -c conda-forge telegram
feh clickup.png
gimp clickup.png
gimp clickup.
convert clickup.jpg clickup.png
sudo aptitude install imagemagick
convert
gimp
cd ../icons/
emacs clickup.desktop
feh ../icons/hicolor/128x128/apps/chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.png
feh ../icons/hicolor//16x16//apps/chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.png
ls ../icons/hicolor//16x16//apps/chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.png
ls ../icons/
cat chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.desktop
cat mimeinfo.cache
cat mimeapps.list
cd .local/share/applications/
find . -name '*clickup*'
ls .local/share/
ls .local/share/applications/
ls .local/share/applications/chrome-hmjkmjkepdijhoojdojkdfohbdgmmhki-Default.desktop
emacs .local/share/applications/
setx
grep setx ubmi01/home/acph/.bash_history
grep setx ../.bash_history
ls ubmi0
sshfs ubmi01:/ .
grep sshfs ../../.bash_history
sudo nano /etc/motd
mkdir ubmi02
mkdir tetis
mkdir 3Dgenome
mkdir aleph
ls  ubmic/ubmi01/storage/Data/
rm  ubmic/ubmi01/storage/Data/sherlyn_rnaseq.tar.gz
ls -ltrh  ubmic/ubmi01/storage/Data/sherlyn_rnaseq.tar.gz
ls -ltrh  ubmic/ubmi01/storage/Data/
ls  ubmic/ubmi01/storage/Data/albros_ubmi01.tar.gz
du -h  ubmic/ubmi01/storage/Data/
rm -rf  ubmic/ubmi01/storage/Data/305sur/
du -h  ubmic/ubmi01/storage/Data/305sur/
ls  ubmic/ubmi01/storage/Data/305sur/
du -d 1 -h /UBMInas/backup/305sur/
ls -hltr /UBMInas/backup/305sur/
ls -hltr /UBMInas/backup/
ls -hltr /UBMInas/backup/aleph/
ls -ltr /UBMInas/backup/aleph/
ls /UBMInas/backup/aleph/
ls /UBMInas/backup/305sur/
ls /UBMInas/backup/
ls  ubmic/ubmi01/storage/Data/ofelia/
ls  ubmic/ubmi01/storage/Data/Ricardo/
rm -rf  ubmic/ubmi01/storage/Data/Pruebas/
rm -rf  ubmic/ubmi01/storage/Data/Andres/
du -d 1 -h  ubmic/ubmi01/storage/Data/Andres/
du -d 1 -h  ubmic/ubmi01/storage/Data/
du -d 0 -h  ubmic/ubmi01/storage/Data/
du -d o -h  ubmic/ubmi01/storage/Data/
ls  ubmic/ubmi01/storage/Data/Clara/
mkdir Proyectos
ls  ubmic/ubmi01/storage/Data/Mara/
ls  ubmic/ubmi01/storage/Data/Karina/
ls  ubmic/ubmi01/storage/Data/Abraham/
ls  ubmic/ubmi01/storage/Data/305sur/NK1706093_R4/
ls  ubmic/ubmi01/storage/Data/Enoch/
ls  ubmic/ubmi01/storage/
ls  ubmic/ubmi01/storage/vbox/
ls  ubmic/ubmi01/home/acph/
ls  ubmic/ubmi01/home/acph/Descargas/
rm  ubmic/ubmi01/home/acph/Descargas/*.iso
ls  ubmic/ubmi01/home/acph/Descargas/*.iso
cp  ubmic/ubmi01/home/acph/Descargas/*.iso ubmic/ubmi01/storage/Isos/
mv  ubmic/ubmi01/home/acph/Descargas/elementaryos-6.1-stable.20211218-rc.iso ubmic/ubmi01/storage/Isos/
mv  ubmic/ubmi01/home/acph/Descargas/*.iso ubmic/ubmi01/storage/Isos/
ls  ubmic/ubmi01/home/acph/Descargas/*.is
ls  ubmic/ubmi01/storage/Isos/
ls  ubmic/ubmi01/storage/bkup/
rm -rf  ubmic/ubmi01/storage/bkup/
mkdir pruebas
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/
feh  ubmic/ubmi01/storage/bkup/pruebas/jupyter/Figura1.png
ls  ubmic/ubmi01/storage/bkup/pruebas/jupyter/
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/rsyncp/
ls  ubmic/ubmi01/storage/bkup/pruebas/rsyncp/
rm  ubmic/ubmi01/storage/bkup/pruebas/prueba_rnaseqview.py
ls  ubmic/ubmi01/storage/bkup/pruebas/
batcat  ubmic/ubmi01/storage/bkup/pruebas/prueba_rnaseqview.py
ls  ubmic/ubmi01/storage/bkup/pruebas/prueba_rnaseqview.py
ls  ubmic/ubmi01/storage/bkup/pruebas/nf-core/results/
rm  ubmic/ubmi01/storage/bkup/pruebas/prueba.txt
batcat  ubmic/ubmi01/storage/bkup/pruebas/prueba.txt
b  ubmic/ubmi01/storage/bkup/pruebas/prueba.txt
c  ubmic/ubmi01/storage/bkup/pruebas/prueba.txt
cat  ubmic/ubmi01/storage/bkup/pruebas/prueba.txt
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/nf-core/
ls  ubmic/ubmi01/storage/bkup/pruebas/nf-core/
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/multiQC/
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/featureCounts/
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/DESeq2_*
ls  ubmic/ubmi01/storage/bkup/pruebas/DESeq2_*
rm -rf  ubmic/ubmi01/storage/bkup/pruebas/deepTools_qc/
ls  ubmic/ubmi01/storage/bkup/pruebas/deepTools_qc/
feh  ubmic/ubmi01/storage/bkup/pruebas/deepTools_qc/plotPCA/PCA.bed_coverage.png
sudo aptitude install feh
asciiart  ubmic/ubmi01/storage/bkup/pruebas/deepTools_qc/plotPCA/PCA.bed_coverage.png
sudo aptitude install asciiart
ls  ubmic/ubmi01/storage/bkup/pruebas/deepTools_qc/plotPCA/
less  ubmic/ubmi01/storage/bkup/pruebas/deepTools_qc/plotPCA/
du -d 0 -h  ubmic/ubmi01/storage/bkup/pruebas/
ls  ubmic/ubmi01/storage/bkup/anil/
rm -rf  ubmic/ubmi01/storage/bkup/Música/
ls Música/
ls M
rsync --progress -r  ubmic/ubmi01/storage/bkup/Música/ Música/
rsync --progress -r  ubmic/ubmi01/storage/bkup/Música/ Música/ -n
rsync --progress -r  ubmic/ubmi01/storage/bkup/Música Música/ -n
ls ubmic/ubmi01/storage/bkup/Música/
ls ubmic/ubmi01/storage/bkup/
ls ubmic/ubmi01/storage/
conda
sudo usermod -a -G sudo cperalta
sudo aptitude install nfs-client sshfs fish zsh
aptitude search nfs
sudo mkdir /UBMInas
aptitude search pass | grep xk
aptitude install pass | grep xk
ls -ltr ../
sudo ls -ltr ../cperalta/.bash_history
sudo ls -ltr ../cperalta/.bashrc
sudo ls -ltr ../cperalta/.*bash*
sudo ls -ltr ../cperalta/.bash*
sudo ls ../cperalta/.bash*
ls -la ../
ls ../cperalta/
sudo aptitude install bat
aptitude search bat
aptitude search batcat
aptitude search catbat
sudo aptitude install guake kupfer
mamba
mamba install tensorflow
conda install tensorflow
sudo python3 InstallSEISbio.py --debian --debupgrade -f mienvs.txt
python3 InstallSEISbio.py  -h
python3 InstallSEISbio.py
sudo userdel -r seisbio
ls /home/
sudo python3 InstallSEISbio.py -f mienvs.txt
sudo python InstallSEISbio.py -f mienvs.txt
nano deb/basic_pkgs.txt
less deb/basic_pkgs.txt
ls deb/basic_pkgs.txt
ls deb/
less mienvs.txt
less small_virtual_envs.txt
cd SEISbio/
scp -r 10.10.180.36:/home/acph/Dropbox/UBMI/SEISbio .
scp 10.10.180.36:/home/acph/Dropbox/UBMI/SEISbio .
mkdir repos
ls /etc/hosts
sudo passwd cperalta
passwd cperalta
sudo useradd -u 1501 -G frecillas -m -s /bin/bash -c "Carlos Peralta,,cperalta@ifc.unam.mx," cperalta
sudo groupadd -g 1500 frecillas
ssh 10.10.180.36 ls /home/acph/Dropbox/UBMI
ssh 10.10.180.36 ls /home/acph/Dropbox
rm -rf runtime/com.obsproject.Studio.Locale/
ls runtime/com.obsproject.Studio.Locale/
ls runtime/
ls repo/
ls db/
ls appstream/flathub/x86_64/
ls appstream/flathub/
ls appstream/
rm -rf app/org.jaspstats.JASP/
ls app/org.jaspstats.JASP/
rm -rf app/com.obsproject.Studio/
ls app
cd .local/share/flatpak/
find . -name "*flat*"
ip ad
sudo nano /etc/hostname
ssh 10.10.180.36 cat /etc/hostname
sudo mv hosts /etc/hosts
sudo mv /etc/hosts /etc/hosts.original
cat hosts
scp 10.10.180.36:/etc/hosts .
scp 10.10.180.36:/home/etc/hosts .
ssh 10.10.180.199
ss 10.10.180.199
ipad
sudo systemctl enable ssh
sudo systemctl enable sshd
flatpak repair --user
sudo flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak repair
sudo flatpak reapair
krita
sudo aptitude install okular
sudo apt autoremove
sudo apt upgrade
sudo apt install openssh-server
sudo apt install openss-server
aptitude search openssh
sudo apt install aptitude
apt search openssh
sudo apt reinstall openssh
sudo apt reinstall mate
sudo apt install mate
sudo apt instrall mate
sudo apt install htop
compiz --replace
compiz
sudo apt install compizconfig-settings-manager emerald
sudo apt search compiz
sudo apt install mate compiz-mate
sudo apt search mate
sudo apt remove compiz-gnome compiz-plugins compiz-plugins-extra
sudo apt install compiz-gnome compiz-plugins compiz-plugins-extra
apt search compiz
aptitude search compiz
nvidia-settings
nvidia-detector
nvidia-xconfig
