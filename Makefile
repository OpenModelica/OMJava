include Makefile.common

dep:
	wget https://build.openmodelica.org/omc/java/OMJava-3rdParty.zip
	unzip -un OMJava-3rdParty.zip

modelica_java.jar: $(java_sources)
	@echo "* Compiling modelica_java.jar"
	rm -rf bin-jar; mkdir bin-jar
	"$(JAVAC)" -encoding utf8 -cp "$(antlr)$(sep)$(corba)" -d bin-jar $(java_sources)
	"$(JAR)" cf modelica_java.jar $(java_sources:src/%=-C src %) $(resources:src/%=-C src %) -C bin-jar . || (rm $@ && false)
	
# OMJava used to be built inside the OpenModelica source tree, so the default
# keeps that layout. It is no longer part of the OpenModelica distribution;
# point OMBUILDDIR at an OpenModelica installation to install into one.
OMBUILDDIR ?= ../build
javadir = $(OMBUILDDIR)/share/omc/java

install: $(javadir)/modelica_java.jar

$(javadir)/modelica_java.jar: modelica_java.jar
	mkdir -p $(@D)
	cp modelica_java.jar 3rdParty/*.jar $(licenses) $(@D)/
	
test: $(java_sources) 
	rm -rf bin-test; mkdir bin-test
	"$(JAVAC)" -encoding utf8 -cp "$(antlr)$(sep)$(junit)$(sep)$(corba)" -d bin-test $(java_sources) $(java_tests)
	"$(JAVA)" -cp "bin-test$(sep)src$(sep)$(antlr)$(sep)$(junit)$(sep)$(corba)" org.junit.runner.JUnitCore $(junit_tests)
