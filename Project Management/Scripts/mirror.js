
$.fn.mirror = function (selector) {
    return this.each(function () {
        var $this = $(this);
        var $selector = $(selector);
        $this.bind('keyup', function () {
            $selector.val(($this.val()));
        });
    });
};

$(document).ready(function () {
    $("#UserEmail").on('keyup keypress blur', function () {
        $('#DefaultPassword').val(this.value +'123'); // copy it over to the mail
    });

    function setDateDiff() {

        var start = $('#PossibleStartDate').val();
        var end = $('#PossibleEndDate').val();
        if (!start || !end) {
            return;
        }
        // end - start returns difference in milliseconds 
        var diff = new Date(new Date(end) - new Date(start));

        // get days
        var days = diff / 1000 / 60 / 60 / 24;
        $('#ProjectDuration').val(days + 1);
    }

    $("#PossibleStartDate").on('keyup keypress blur', function () {
        setDateDiff();
    });
    $("#PossibleEndDate").on('keyup keypress blur', function () {
        setDateDiff();
    });
    /*----------------------------*/

    $('#ProjectId').change(function () {
        $.ajax({
            type: "get",
            url: "/Home/GetProjectUsers",
            data: { projectId: $('#ProjectId').val() },
            datatype: "json",
            traditional: true,
            success: function (data) {
                var projectUsersHtml = "<select id='PersonsUserId' name='PersonUserId' class='form-control' required=''>";
                projectUsersHtml = projectUsersHtml + '<option value="">--Select--</option>';
                for (var i = 0; i < data.length; i++) {
                    projectUsersHtml = projectUsersHtml + '<option value=' + data[i].Id + '>' + data[i].UserName + '</option>';
                }
                projectUsersHtml = projectUsersHtml + '</select>';
                $('#user-container').html(projectUsersHtml);
            }
        });
    }).change();

});