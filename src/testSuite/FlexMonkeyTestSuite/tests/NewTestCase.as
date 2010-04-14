package testSuite.FlexMonkeyTestSuite.tests{
    import com.gorillalogic.flexmonkey.flexunit.tests.MonkeyFlexUnitTestCase;

    import com.gorillalogic.flexmonkey.core.MonkeyTest;
    import com.gorillalogic.flexmonkey.monkeyCommands.*;
    import com.gorillalogic.flexmonkey.application.VOs.AttributeVO;
    import com.gorillalogic.flexmonkey.events.MonkeyCommandRunnerEvent;

    import mx.collections.ArrayCollection;

    public class NewTestCase extends MonkeyFlexUnitTestCase{
        public function NewTestCase(){
            super();
        }

        private var mtNewTest1:MonkeyTest = new MonkeyTest('NewTest1', 500,
            new ArrayCollection([
                new UIEventMonkeyCommand('SelectText', 'inName', 'automationName', [0, '0']),
                new UIEventMonkeyCommand('Input', 'inName', 'automationName', ['eastagie']),
                new UIEventMonkeyCommand('Type', 'inName', 'automationName', ['BACKSPACE']),
                new UIEventMonkeyCommand('Input', 'inName', 'automationName', ['le']),
                new UIEventMonkeyCommand('Type', 'inType', 'automationName', ['DOWN']),
                new UIEventMonkeyCommand('Type', 'inType', 'automationName', ['DOWN']),
                new UIEventMonkeyCommand('Type', 'inType', 'automationName', ['DOWN']),
                new UIEventMonkeyCommand('Type', 'inType', 'automationName', ['TAB']),
                new UIEventMonkeyCommand('Input', 'inPhone', 'automationName', ['123123123']),
                new UIEventMonkeyCommand('Open', 'inDate', 'automationName', [null]),
                new UIEventMonkeyCommand('Change', 'inDate', 'automationName', ['Thu Apr 15 2010']),
                new UIEventMonkeyCommand('Click', 'Add', 'automationName', [null]),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | eastagile | *Mobile* | 123123123 | Thu Apr 15 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Open', 'automationClassName{FlexApplication string}className{AirMonkey string}label{ string}automationName{com.gorillalogic.FlexMonkey string}automationIndex{index:-1 string}id{com.gorillalogic.FlexMonkey string}|automationClassName{FlexApplication string}className{MonkeyContacts string}label{ string}automationName{index:1 string}automationIndex{index:2 string}id{null object}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexTitleWindow string}className{mx.containers.TitleWindow string}automationName{index:0 string}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexDividedBox string}className{mx.containers.VDividedBox string}automationName{index:0 string}|automationClassName{FlexDataGrid string}automationIndex{index:6 string}automationName{grid string}id{grid string}className{mx.controls.DataGrid string}|automationClassName{FlexComboBox string}automationIndex{type:0 string}automationName{%20%20%7C%20eastagile%20%7C%20Mobile%20%7C%20123123123%20%7C%20Thu%20Apr%2015%2000:00:00%20GMT+0700%202010 string}id{null object}className{MonkeyContacts_inlineComponent1 string}', 'automationID', [null]),
                new UIEventMonkeyCommand('Select', 'automationClassName{FlexApplication string}className{AirMonkey string}label{ string}automationName{com.gorillalogic.FlexMonkey string}automationIndex{index:-1 string}id{com.gorillalogic.FlexMonkey string}|automationClassName{FlexApplication string}className{MonkeyContacts string}label{ string}automationName{index:1 string}automationIndex{index:2 string}id{null object}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexTitleWindow string}className{mx.containers.TitleWindow string}automationName{index:0 string}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexDividedBox string}className{mx.containers.VDividedBox string}automationName{index:0 string}|automationClassName{FlexDataGrid string}automationIndex{index:6 string}automationName{grid string}id{grid string}className{mx.controls.DataGrid string}|automationClassName{FlexComboBox string}automationIndex{type:0 string}automationName{%20%20%7C%20eastagile%20%7C%20Mobile%20%7C%20123123123%20%7C%20Thu%20Apr%2015%2000:00:00%20GMT+0700%202010 string}id{null object}className{MonkeyContacts_inlineComponent1 string}', 'automationID', ['Work']),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | eastagile | Work | *123123123* | Thu Apr 15 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Input', 'automationClassName{FlexApplication string}className{AirMonkey string}label{ string}automationName{com.gorillalogic.FlexMonkey string}automationIndex{index:-1 string}id{com.gorillalogic.FlexMonkey string}|automationClassName{FlexApplication string}className{MonkeyContacts string}label{ string}automationName{index:1 string}automationIndex{index:2 string}id{null object}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexTitleWindow string}className{mx.containers.TitleWindow string}automationName{index:0 string}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexDividedBox string}className{mx.containers.VDividedBox string}automationName{index:0 string}|automationClassName{FlexDataGrid string}automationIndex{index:6 string}automationName{grid string}id{grid string}className{mx.controls.DataGrid string}|displayAsPassword{false boolean}id{null object}automationIndex{phone:0 string}editable{true boolean}automationClassName{FlexTextArea string}automationName{%20%20%7C%20eastagile%20%7C%20Work%20%7C%202323%20%7C%20Thu%20Apr%2015%2000:00:00%20GMT+0700%202010 string}className{mx.controls.TextInput string}', 'automationID', ['2323']),
                new UIEventMonkeyCommand('Click', 'grid', 'automationName', [null]),
                new UIEventMonkeyCommand('Click', 'grid', 'automationName', [null]),
                new UIEventMonkeyCommand('Click', 'Add', 'automationName', [null]),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | *eastagile* | Work | 2323 | Thu Apr 15 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Click', 'Delete', 'automationName', [null]),
                new UIEventMonkeyCommand('SelectText', 'inName', 'automationName', [0, '0']),
                new UIEventMonkeyCommand('Input', 'inName', 'automationName', ['tin']),
                new UIEventMonkeyCommand('Type', 'inName', 'automationName', ['BACKSPACE']),
                new UIEventMonkeyCommand('Input', 'inName', 'automationName', ['enle']),
                new UIEventMonkeyCommand('Type', 'inType', 'automationName', ['TAB']),
                new UIEventMonkeyCommand('Input', 'inPhone', 'automationName', ['0909999999']),
                new UIEventMonkeyCommand('Open', 'inDate', 'automationName', [null]),
                new UIEventMonkeyCommand('Change', 'inDate', 'automationName', ['Mon Apr 19 2010']),
                new UIEventMonkeyCommand('Click', 'Add', 'automationName', [null]),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | *eastagile* | Mobile | 123123123 | Thu Apr 15 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | *tienle* | Mobile | 0909999999 | Mon Apr 19 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | tienle | *Mobile* | 0909999999 | Mon Apr 19 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Open', 'automationClassName{FlexApplication string}className{AirMonkey string}label{ string}automationName{com.gorillalogic.FlexMonkey string}automationIndex{index:-1 string}id{com.gorillalogic.FlexMonkey string}|automationClassName{FlexApplication string}className{MonkeyContacts string}label{ string}automationName{index:1 string}automationIndex{index:2 string}id{null object}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexTitleWindow string}className{mx.containers.TitleWindow string}automationName{index:0 string}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexDividedBox string}className{mx.containers.VDividedBox string}automationName{index:0 string}|automationClassName{FlexDataGrid string}automationIndex{index:6 string}automationName{grid string}id{grid string}className{mx.controls.DataGrid string}|automationClassName{FlexComboBox string}automationIndex{type:0 string}automationName{%20%20%7C%20tienle%20%7C%20Mobile%20%7C%200909999999%20%7C%20Mon%20Apr%2019%2000:00:00%20GMT+0700%202010 string}id{null object}className{MonkeyContacts_inlineComponent1 string}', 'automationID', [null]),
                new UIEventMonkeyCommand('Select', 'automationClassName{FlexApplication string}className{AirMonkey string}label{ string}automationName{com.gorillalogic.FlexMonkey string}automationIndex{index:-1 string}id{com.gorillalogic.FlexMonkey string}|automationClassName{FlexApplication string}className{MonkeyContacts string}label{ string}automationName{index:1 string}automationIndex{index:2 string}id{null object}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexTitleWindow string}className{mx.containers.TitleWindow string}automationName{index:0 string}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexDividedBox string}className{mx.containers.VDividedBox string}automationName{index:0 string}|automationClassName{FlexDataGrid string}automationIndex{index:6 string}automationName{grid string}id{grid string}className{mx.controls.DataGrid string}|automationClassName{FlexComboBox string}automationIndex{type:0 string}automationName{%20%20%7C%20tienle%20%7C%20Mobile%20%7C%200909999999%20%7C%20Mon%20Apr%2019%2000:00:00%20GMT+0700%202010 string}id{null object}className{MonkeyContacts_inlineComponent1 string}', 'automationID', ['Work']),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | eastagile | *Mobile* | 123123123 | Thu Apr 15 00:00:00 GMT+0700 2010'])
            ]));

        private var mtNewTest1TimeoutTime:int = 60500;

        [Test]
        public function NewTest1():void{
            // startTest(<MonkeyTest>, <Complete method>, <Async timeout value>, <Timeout method>);
            startTest(mtNewTest1, mtNewTest1Complete, mtNewTest1TimeoutTime, defaultTimeoutHandler);
        }

        public function mtNewTest1Complete(event:MonkeyCommandRunnerEvent, passThroughData:Object):void{
            checkCommandResults(mtNewTest1);
        }

        private var mtNewTest2:MonkeyTest = new MonkeyTest('NewTest2', 500,
            new ArrayCollection([
                new UIEventMonkeyCommand('SelectText', 'inName', 'automationName', [0, '0']),
                new UIEventMonkeyCommand('Input', 'inName', 'automationName', ['test2']),
                new UIEventMonkeyCommand('SelectText', 'inPhone', 'automationName', [0, '0']),
                new UIEventMonkeyCommand('Input', 'inPhone', 'automationName', ['21312']),
                new UIEventMonkeyCommand('Open', 'inDate', 'automationName', [null]),
                new UIEventMonkeyCommand('Scroll', 'inDate', 'automationName', [1]),
                new UIEventMonkeyCommand('Scroll', 'inDate', 'automationName', [1]),
                new UIEventMonkeyCommand('Scroll', 'inDate', 'automationName', [1]),
                new UIEventMonkeyCommand('Change', 'inDate', 'automationName', ['Fri Jul 2 2010']),
                new UIEventMonkeyCommand('Click', 'Add', 'automationName', [null]),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | test2 | Mobile | 21312 | *Fri Jul 2 00:00:00 GMT+0700 2010*']),
                new UIEventMonkeyCommand('SelectText', 'automationClassName{FlexApplication string}className{AirMonkey string}label{ string}automationName{com.gorillalogic.FlexMonkey string}automationIndex{index:-1 string}id{com.gorillalogic.FlexMonkey string}|automationClassName{FlexApplication string}className{MonkeyContacts string}label{ string}automationName{index:1 string}automationIndex{index:2 string}id{null object}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexTitleWindow string}className{mx.containers.TitleWindow string}automationName{index:0 string}|label{ string}automationIndex{index:0 string}id{null object}automationClassName{FlexDividedBox string}className{mx.containers.VDividedBox string}automationName{index:0 string}|automationClassName{FlexDataGrid string}automationIndex{index:6 string}automationName{grid string}id{grid string}className{mx.controls.DataGrid string}|displayAsPassword{false boolean}id{null object}automationIndex{birthday:0 string}editable{true boolean}automationClassName{FlexTextArea string}automationName{%20%20%7C%20test2%20%7C%20Mobile%20%7C%2021312%20%7C%20Fri%20Jul%202%2000:00:00%20GMT+0700%202010 string}className{mx.controls.TextInput string}', 'automationID', [14, '14']),
                new UIEventMonkeyCommand('Select', 'grid', 'automationName', ['  | *test2* | Mobile | 21312 | Fri Jul 2 00:00:00 GMT+0700 2010']),
                new UIEventMonkeyCommand('Input', 'scoozy', 'automationName', ['2']),
                new UIEventMonkeyCommand('Type', 'scoozy', 'automationName', ['BACKSPACE']),
                new UIEventMonkeyCommand('Input', 'scoozy', 'automationName', ['test222']),
                new UIEventMonkeyCommand('Click', 'grid', 'automationName', [null])
            ]));

        private var mtNewTest2TimeoutTime:int = 30500;

        [Test]
        public function NewTest2():void{
            // startTest(<MonkeyTest>, <Complete method>, <Async timeout value>, <Timeout method>);
            startTest(mtNewTest2, mtNewTest2Complete, mtNewTest2TimeoutTime, defaultTimeoutHandler);
        }

        public function mtNewTest2Complete(event:MonkeyCommandRunnerEvent, passThroughData:Object):void{
            checkCommandResults(mtNewTest2);
        }


    }
}