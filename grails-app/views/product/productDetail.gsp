<%--
  Created by IntelliJ IDEA.
  User: Brahmastra
  Date: 7/26/2017
  Time: 4:08 PM
--%>

<%@ page import="demo.Product" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/button.css">

    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<script type="text/javascript">
    var cart=[];
    var Item=function(name,price,count){
      this.name=name
      this.price=price
      this.count=count
    };
    function addItemToCart(name,price,count){
        for(var i in cart){
            if(cart[i].name===name) {
                cart[i].count += count;
                return;
            }
            }
        var item=new Item(name, price, count);
        cart.push(item);
        }
    addItemToCart()

    }
</script>
<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link controller="user" action="loginForm">Login</g:link>  </li>
        <li><a href="#">My cart</a> </li>
    </ul>
</div>
<div id="list-product" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="product.category.label" default="Category" /></th>

            <g:sortableColumn property="imagePath" title="${message(code: 'product.image.label', default: 'Image')}" />

            <g:sortableColumn property="manufacturer" title="${message(code: 'product.manufacturer.label', default: 'Manufacturer')}" />

            <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />

            <g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />
            <th width="10%">Add to cart</th>



        </tr>
        </thead>
        <tbody>
        <g:each in="${productList}" status="i" var="products">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${fieldValue(bean: products, field: "category")}</td>

                <td><img src="${resource(dir: 'images/products', file: "${products.imagePath}")}" height="72px" width="72px" /></td>

                <td>${fieldValue(bean: products, field: "manufacturer")}</td>

                <td>${fieldValue(bean: products, field: "name")}</td>

                <td>${fieldValue(bean: products, field: "price")}</td>
                <td>
                    <button onclick="adItemToCart"  class="btn btn-success btn-lg"><span class="glyphicon glyphicon-shopping-cart"></span></button>
                </td>



            </tr>
        </g:each>
        </tbody>
    </table>
    %{--<div class="pagination">
        <g:paginate total="${productListTotal}" />
    </div>--}%
</div>
</body>
</html>


