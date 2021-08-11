# flutter_template

This is the template project having all required basic setup.

# Coding guidelines


**1. Naming Guidelines**
========================
It is a good practice to write code in such a way
that it should be self-explanatory. The variables and functions should
be named based on the operations they are assigned for.

-   **Packages\
    **Packages and source files should be named using *lowercase*letters
    with an *underscore*. For example, a ‘test driver’ package should be
    named ‘**test\_driver’** while a package for ‘dependency injection’
    should be named **dependency\_injection**.
-   **Classes\
    **Classes, enums, and parameters should be named using *‘Upper Camel
    Case’*****letters *with no underscore* and where only the first
    letter of the word is capitalized. For example:

```
class AuthViewModel {…}
enum AuthStatus {success,failed,error}
```

Also, the filename should be lowercase with an underscore. For example:
`auth_view_model.dart`

-   **Methods & Variables\
    **Similar to classes, methods and variables should also be named in
    camel case, but in Lower Camel Case. For example:

```
var userProfile;

AuthNotification authNotification;

void loadUserProfile() {//TODO: write your code}
```

**2. Ordering Guidelines**
==========================

Ordering of every section is very important for differentiating the
method, variable and property. Every section should be in order, and
separated by an empty line.

Ordering guidelines for different class components are as follows:

-   **Order of class property**
public class myClass
{
#region Private Members

#endregion

#region Public Properties

#endregion

#region Constructors

#endregion

#region Public Methods

#endregion
}
```

-   **Order of imports/export sections**

**A\> “dart:” imports must come before other imports.**

```

import ‘dart:async’;
import ‘dart:html’;
import ‘package:model/UserModel.dart’;
import ‘package:network/HttpRequest.dart’
```

**B\> “export:” should be after other imports.**

```
import ‘package:fft/src/appflow/app_coordinator.dart’;
import ‘package:fft/src/appflow/main_flow/main_tab.dart’;
import ‘package:fft/src/appflow/splash_screen.dart’;
export ‘package:async/src/error.dart’;
```

**3. Formatting Guidelines** {#3592 .mt .mu .dm .bp .kk .mv .os .hf .mx .my .ot .hj .na .nb .ou .nd .ne .nf .ov .nh .ni .nj .ow .nl .nm .nn .ej data-selectable-paragraph=""}
============================

Formatting rules or guidelines are used when writing source code in Dart
language. If programmers use good style for writing source code, it will
improve source code readability and understandability, and conform to a
standard style. This can help avoid introducing errors in the code.

-   **Format code using ‘*dartfmt’*** \
    Code Formatting is uninteresting and particularly time-consuming
    during refactoring. But we need not worry about it. Dart provides an
    advanced automated code formatter called *dartfmt* that does the job
    for you. Using dartfmt, you can remove the official whitespace.
-   **Make your code more formatter-friendly\
    **Usage of long identifiers, deeply nested expressions, a mixture of
    different kinds of operators, etc. makes it difficult to read (or
    understand) code even after formatting. Code structure and naming
    should be as simple as possible.
-   **Use 80 characters in a line\
    **If you would like the code to be read in the format of a paragraph
    or an essay, you need to write maximum of 80 characters in a line.
    Otherwise your code is likely to be too wordy or could be a harder
    to read.

Methods shouldn’t have more than an average of 30 code lines, excluding
line spaces and comments.

**4. Practice Coding** 
======================

We can learn and practice programming by following a few rules, as
mentioned below:


-   **Return ‘Widget’\
    ** We can return *Widget* instead of Flutter Widget. As your project
    evolves, you may change the widget type that is returned by your
    function. Let us take an example: you may prefer to wrap your widget
    with *Center()*. \
    By returning a widget, refactoring is simplified, since the method
    signature does not change.\
    For Example:

```
Widget returnContainerWidget()
{
	return Center(child: Container());
}
```

-   **Boolean\
    **We can use the null check operator ‘??’ to *convert null to a
    boolean value*. We must convert the null value to either *true* or
    *false*. \
    Although you could do this using ‘==’, using the ‘??’ operator
    instead is easier to use, and reduces lines of code used.\
    For example:

```
userProfile?.isEnabled ?? false;
```

-   **Use async/await \
    **For raw future functions, use *aync/await*. Any function you want
    to run asynchronously must have the **async**modifier added to it.
    When you are adding the ***await***modifier, the code is explicitly
    saying: “*don’t go further until my future is completed*”.\
    For example:

```
function () async
{
	var data = await loadData();// Do something…
}
```


