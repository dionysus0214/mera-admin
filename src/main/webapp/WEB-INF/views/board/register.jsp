<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="../include/header.jsp" %>

<!-- Main contents -->
<section class="contents">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">REGISTER BOARD</h3>
                </div>
                <!-- /.box-header -->

                <form role="form" method="post">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input type="text" name='title' id='title' class="form-control" placeholder="Enter Title">
                        </div>
                        <div class="form-group">
                            <label for="content">Content</label>
                            <textarea class="form-control" name="content" id="content" rows="3"
                                      placeholder="Enter ..."></textarea>
                        </div>
                        <div class="form-group">
                            <label for="writer">Writer</label>
                            <input type="text" name="writer" id="writer" class="form-control" placeholder="Enter Writer">
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>

            </div>
            <!-- /.box -->
        </div>
        <!--/.col (left) -->

    </div>
    <!-- /.row -->
</section>
<!-- /.contents -->
</div>
<!-- /.contents-wrapper -->

<%@include file="../include/footer.jsp" %>
