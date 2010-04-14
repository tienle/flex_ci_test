Continuous Integration with Flex
===========
Sample for continuous integration with Flex, FlexUnit, FlexMonkey, CC.rb

*Written by __tien.le__*

# Stuff we need: #
* Flex SDK 3.5+ or Flex Builder
* Source code repository (Git/Subversion)
* CruiseControl.rb a continuous integration tool written in Ruby
* Ant for automating build processes
* FlexUnit for unit testing
* FlexMonkey for UI testing (similar to SeleniumHq)

 _(NOTE: To see the full sample project, please checkout http://github.com/infinity42/flex_ci_test)_ 

STEPS
------------
1. Setup Flex development environment (SDK/ Builder)
2. Setup CruiseControl.rb with Git repository (refer here for more details)
3. Install Ant (there's a very helpful guide about installation of Ant on Mac OS here)
4. Assume your Flex SDK locates here: /Applications/Adobe Flex Builder 3/sdks/3.2.0
5. Create a directory to hold a new Flex project or create a new project with Flex Builder.(name it what you like)
6. Create a source directory called “src” in your project directory. (done for you with Flex Builder)
7. Create a library directory called “libs” in your project directory. (done for you with Flex Builder)
8. Add all of the FlexUnit4 swc, flexUnitTask.jar and flexTask.jar files you downloaded above to the libs directory. (for more details on using FlexUnit, please see here and here )
9. Create an mxml file called UnitTestRunner.mxml in the src directory.
10. Add this code to UnitTestRunner.mxml:


      <?xml version="1.0" encoding="utf-8"?>
        <mx:application xmlns:mx="http://www.adobe.com/2006/mxml" xmlns:adobe="http://www.adobe.com/2009/flexunituirunner"
          layout="absolute" creationcomplete="runme()">
          <mx:script>
            <![cdata[
            import testsuite.mytestsuite;
            import org.flexunit.runner.notification.runlistener;
            import org.flexunit.listeners.cilistener;
            import org.flexunit.listeners.uilistener;
            import org.flexunit.runner.flexunitcore;
            import mx.events.flexevent;
            import mx.logging.logeventlevel;
            import org.flexunit.internals.textlistener;
            import org.flexunit.internals.tracelistener;
                    
            private var core:flexunitcore;
            public function runme():void
            {
                core = new flexunitcore();

                /**if you don't need graphical test results, comment out the line below and the mxml declaring the testrunnerbase. **/
                core.addlistener(new uilistener(uilistener));
                core.addlistener(new cilistener());
                            
                /**if you would like to see text output in verbose mode, umcomment either of the follow listeners **/
                //core.addlistener( new tracelistener() ); - for as3 projects
                //core.addlistener( textlistener.getdefaulttextlistener( logeventlevel.debug ) ); /* for flex projects */
                core.run(testsuite.mytestsuite);
            } 
            ]]>
          </mx:script>
          <adobe:testrunnerbase id="uilistener" width="100%" height="100%"  />
        </mx:application>


11. create an actionscript file called mytestsuite.as in the src/testsuite directory.
12. add this code to mytestsuite.as:


      package testSuite
      {
        import testSuite.tests.*;
        
        [Suite]
        [RunWith("org.flexunit.runners.Suite")]
        public class MyTestSuite
        {
          public var testcase1:TestCase1;
          public function MyTestSuite() { }
        }
      }


13. Create a actionscript file called TestCase1.as in the src/testSuite/tests directory.
14. Add this code to TestCase1.as:


      package testSuite.tests
      {
        import flexunit.framework.*;
        
        public class TestCase1
        {
          public function TestCase1()
          {			
          }
          
          [Test(description="test addition method of testcase1")]
          public function addition():void {
            Assert.assertEquals(12, 5+5);			
          }
          
          [Test]
          public function subtraction():void {
            Assert.assertEquals(3, 2 + 1);
          }
          
          [Before]
          public function runBeforeEveryTest(): void {
            trace("before");
          }
          
          [After]
          public function runAfterEveryTest(): void {
            trace("after");
          }
        }
      }


15. Create an ant build file called “build.xml” and put it in the root of your project directory
16. Add this to the ant build file. (you may need to edit the paths depending on your Flex SDK version):


      <?xml version="1.0" encoding="UTF-8"?>
        <project name="Flex CI Sample" basedir="." default="package">
          <!-- setup a prefix for all environment variables -->
          <property environment="env" />

          <!-- Setup paths for build -->
          <property name="main.src.loc" location="${basedir}/src" />
          <property name="test.src.loc" location="${basedir}/src" />
          <property name="lib.loc" location="${basedir}/libs" />
          <property name="output.loc" location="${basedir}/target" />
          <property name="bin.loc" location="${output.loc}/bin" />
          <property name="report.loc" location="${output.loc}/report" />
          <property name="dist.loc" location="${output.loc}/dist" />
          <property name="testrunner.name" value="UnitTestRunner" />

          <!-- Setup Flex and FlexUnit ant tasks -->
          <!-- You can set this directly so mxmlc will work correctly, or set FLEX_HOME as an environment variable and use as below -->
          <property name="FLEX_HOME" location="/Applications/Adobe Flex Builder 3/sdks/3.2.0" />
          <taskdef resource="flexTasks.tasks" classpath="${lib.loc}/flexTasks.jar" />
          <taskdef resource="flexUnitTasks.tasks" classpath="${lib.loc}/flexUnitTasks-4.0.0.jar" />

          <target name="clean">
            <!-- Remove all directories created during the build process -->
            <echo>cleaning...</echo>
            <delete dir="${output.loc}" />
          </target>

          <target name="init">
            <!-- Create directories needed for the build process -->
            <echo>initializing...</echo>
            <mkdir dir="${output.loc}" />
            <mkdir dir="${bin.loc}" />
            <mkdir dir="${report.loc}" />
            <mkdir dir="${dist.loc}" />
          </target>

          <target name="compile" depends="init">
            <echo>compiling...</echo>
            <!-- Compile Main.mxml as a SWF -->
            <mxmlc file="${main.src.loc}/TestChart.mxml" output="${bin.loc}/TestChart.swf">
              <library-path dir="${lib.loc}" append="true">
                <include name="*.swc" />
              </library-path>
              <compiler.verbose-stacktraces>true</compiler.verbose-stacktraces>
              <compiler.headless-server>true</compiler.headless-server>
            </mxmlc>
          </target>

          <target name="test" depends="compile">
            <echo>unit testing...</echo>
            <!-- Compile TestRunner.mxml as a SWF -->
            <mxmlc file="${test.src.loc}/${testrunner.name}.mxml" output="${bin.loc}/${testrunner.name}.swf">
              <source-path path-element="${main.src.loc}" />
              <library-path dir="${lib.loc}" append="true">
                <include name="*.swc" />
              </library-path>
              <compiler.verbose-stacktraces>true</compiler.verbose-stacktraces>
              <compiler.headless-server>true</compiler.headless-server>
            </mxmlc>

            <!-- Execute TestRunner.swf as FlexUnit tests and publish reports -->
            <flexunit swf="${bin.loc}/${testrunner.name}.swf" 
              toDir="${report.loc}" 
              haltonfailure="false" 
              verbose="true" 
              localTrusted="true" />

            <!-- Generate readable JUnit-style reports -->
            <junitreport todir="${report.loc}">
              <fileset dir="${report.loc}">
                <include name="TEST-*.xml" />
              </fileset>
              <report format="frames" todir="${report.loc}/html" />
            </junitreport>
          </target>

          <target name="package" depends="test">
            <!-- Assemble final website -->
            <copy file="${bin.loc}/TestChart.swf" todir="${dist.loc}" />
            <html-wrapper swf="TestChart" template="express-installation" output="${dist.loc}" height="100%" width="100%" />

            <!-- Zip up final website -->
            <zip destfile="${output.loc}/${ant.project.name}.zip">
              <fileset dir="${dist.loc}" />
            </zip>
          </target>
        </project>


17. Check all this into an git/svn repository
18. Open terminal and head to the CruiseControl.rb directory you downloaded in step 2.
19. Type this command but replace the “ProjectName” and url with real stuff:


    `cruise add ProjectName -u "http://url.of.the.svn.repoitory.you/just/created"`

    or using git repository (refer here) like: 
      
    `./cruise add FlexCISample --url git://github.com/infinity42/flex_ci_test.git -s git`

 
20. Open up the following file in a text editor:


    `~/.cruise/projects/FlexCISample/cruise_config.rb`


21. Right below this line “Project.configure do |project|” add this:


    `project.build_command = 'ant package'`


22. Go back to the main CruiseControl.rb directory
23. Type this command:


    `./cruise start`


24. Click here [http://localhost:333] (the url of your CC.rb)
25. Done. Congrats!


Helpful stuff:
--------------
- Continuous Integration with Flex, FlexUnit and Ant by Daniel R.
- FlexMonkey Userguide
- Running FlexMonkey tests from Ant  , another guide here and here
- Running FlexUnit from Ant
- FlexUnit Wiki
- Using FlexUnit4 with Flex SDK 3 sample
- CruiseControl.rb getting started
- Installation of Ant on Mac OS


