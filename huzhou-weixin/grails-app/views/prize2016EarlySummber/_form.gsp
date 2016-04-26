<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>

<dl class="dl-horizontal">
  <dt>
  	<label for="description">
		<g:message code="prize2016EarlySummber.description.label" default="Description" />
	</label>
  </dt>  
  <dd><div class="col-md-6">
  	<g:textField class="form-control" name="description" value="${prize2016EarlySummberInstance?.description}"/>
  </div></dd>
</dl>
<dl class="dl-horizontal">
  <dt>
  	<label for="index">
		<g:message code="prize2016EarlySummber.index.label" default="Index" />
	</label>
  </dt>  
  <dd><div class="col-md-6">
  	<g:field class="form-control" name="index" type="number" value="${prize2016EarlySummberInstance.index}"/>
  </div></dd>
</dl>
<dl class="dl-horizontal">
  <dt>
  	<label for="amount">
		<g:message code="prize2016EarlySummber.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
  </dt>  
  <dd><div class="col-md-6">
  	<g:field class="form-control" name="amount" type="" 	value="${fieldValue(bean: prize2016EarlySummberInstance, field: 'amount')}" required=""/>
  </div></dd>
</dl>
<dl class="dl-horizontal">
  <dt>
  	<label for="name">
		<g:message code="prize2016EarlySummber.name.label" default="Name" />
		
	</label>
  </dt>  
  <dd><div class="col-md-6">
  	<g:textField class="form-control" name="name" value="${prize2016EarlySummberInstance?.name}"/>
  </div></dd>
</dl>
<dl class="dl-horizontal">
  <dt>
  	<label for="valuable">
		<g:message code="prize2016EarlySummber.valuable.label" default="Valuable" />
		
	</label>
  </dt>  
  <dd><div class="col-md-6">
  	<g:checkBox name="valuable" value="${prize2016EarlySummberInstance?.valuable}" />
  </div></dd>
</dl>

