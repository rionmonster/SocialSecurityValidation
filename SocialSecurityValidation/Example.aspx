<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Example.aspx.cs" Inherits="SocialSecurityValidation.Example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Javascript-Only Validation</h1>
    <pre>Basic Validation (Format Only)</pre>
    <input id='ssn1' value='555-55-5555' /><button onclick='basicValidate(ssn1.value);'>Validate</button>

    <pre>Actual Validation (Using rules defined by the Social Security Administration)</pre>
    <input id='ssn2' value='555-55-5555'/><button onclick='actualValidate(ssn2.value);'>Validate</button>

    <pre>"Over-the-top" Validation (Handles previously mentioned rules and a few common exceptions)</pre>
    <input id='ssn3' value='555-55-5555' /><button onclick='overTheTopValidate(ssn3.value);'>Validate</button>

    <h1>Server-side Validation</h1>
    <form id="form1" runat="server">
        <pre>Basic Validation (Format Only)</pre>
        <asp:TextBox ID="SSN1" Text="555-55-5555" runat="server"></asp:TextBox><asp:Button ID="BasicValidationButton" runat="server" Text="Validate" OnClick="BasicValidationButton_Click" />

        <pre>Actual Validation (Using rules defined by the Social Security Administration)</pre>
        <asp:TextBox ID="SSN2" Text="555-55-5555" runat="server"></asp:TextBox><asp:Button ID="ActualValidationButton" runat="server" Text="Validate" OnClick="ActualValidationButton_Click" />

        <pre>"Over-the-top" Validation (Handles previously mentioned rules and a few common exceptions)</pre>
        <asp:TextBox ID="SSN3" Text="555-55-5555" runat="server"></asp:TextBox><asp:Button ID="OverTheTopValidationButton" runat="server" Text="Validate" OnClick="OverTheTopValidationButton_Click" />

    </form>
    <!-- Javascript Validation Functions -->
    <script type="text/javascript">
        //Basic Validation (format only)
        function basicValidate(ssn) {
            //Build your expression
            var regex = new RegExp("^\\d{3}-\\d{2}-\\d{4}$");
            //Test your current value
            alert(regex.test(ssn));
        }

        //Actual Validation 
        function actualValidate(ssn) {
            //Build your expression
            var regex = new RegExp("^(?!219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
            //Test your current value
            alert(regex.test(ssn));
        }

        //"Over-the-top" Validation 
        function overTheTopValidate(ssn) {
            //Build your expression
            var regex = new RegExp("^(?!\\b(\\d)\\1+-(\\d)\\1+-(\\d)\\1+\\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}$");
            //Test your current value
            alert(regex.test(ssn));
        }
    </script>
</body>
</html>
