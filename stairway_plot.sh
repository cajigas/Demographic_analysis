cd $HOME/vicentei/population_genetics/demography/stairwayplot

# now run all blueprints
java -cp stairway_plot_es Stairbuilder CEI.realSFS.blueprint
bash East.realSFS.blueprint.sh

java -cp stairway_plot_es Stairbuilder West.realSFS.blueprint
bash West.realSFS.blueprint.sh




