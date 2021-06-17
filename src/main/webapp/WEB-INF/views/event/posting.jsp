<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <title>JobBoard &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <link rel="stylesheet" href="css/custom-bs.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="fonts/line-icons/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/quill.snow.css">
    <style type="text/css">
    	.editor {
  height: 375px; }
    </style>

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="css/style.css">    
  </head>
  <body id="top">

  <div id="overlayer"></div>
  <div class="loader"> 
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
    

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="site-logo col-6"><a href="index.html">Review</a></div>

          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
            <div class="ml-auto">
              <a href="post-job.html" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-add"></span>Post a Job</a>
              <a href="login.html" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>Log In</a>
            </div>
            <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
          </div>

        </div>
      </div>
    </header>

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Add A Review</h1>
          
          </div>
        </div>
      </div>
    </section>

    
    <section class="site-section">
      <div class="container">

        <div class="row align-items-center mb-5">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <div class="d-flex align-items-center">
              <div>
                <h2>Add A Review</h2>
              </div>
            </div>
          </div>
         
        </div>
        <div class="row mb-5">
          <div class="col-lg-12">
 
              <h3 class="text-black mb-5 border-bottom pb-2">여러분의 방문후기를 공유해주세요^^!</h3>
              
              
               <form action= "/event/insertPosting/${evNo}"  method = "post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="company-website-tw d-block">Upload Featured Image</label> <br>
                
                <label class="btn btn-primary btn-md btn-file">
                  Browse File<input type="file" name = "file">
                </label>
              </div>

              
              <div class="form-group">
                <label for="job-title">제목</label>
                <input type="text" class="form-control" id="job-title" placeholder="제목을 입력해주세요" name="evpTitle">
              </div>
              <!-- <div class="form-group">
                <label for="job-location">지역</label>
<input type="text" class="form-control" id="job-location" placeholder="지역을 입력해주세요" name= " ">
              </div>
   -->  

             <div class="form-group">
                <label for="job-description">방문후기</label>
                <div class="editor" id="editor-1">
                <textarea type="text" class="form-control" id="editor_text"  placeholder="내용을 입력해주세요"  name="evpContent"
               style= "width:1140px; height:300px"> </textarea><br>
                </div>
              </div>
             
               
          

        <div class="row align-items-center mb-5">
          
          <div class="col-lg-4 ml-auto">
            <div class="row">
           
              <div class="col-6">
              <input type ="submit" class ="site-btn" id = "submitbt" value = "submitButton">
              </div>
              
            </div>
          </div>
        </div>
        	 </form>
        	 
        	 
        	 
      </div>
      </div>
      </div>
    </section>

</div>



</body>
</html>