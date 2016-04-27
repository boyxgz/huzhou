<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>


<dl class="dl-horizontal">
	<dt>
		<label for="name">
			<g:message code="prize2016EarlySummber.name.label" default="Name" />
		</label>
	</dt>
	<dd><div class="col-md-6">
		<g:textField name="name" value="${prize2016EarlySummberInstance?.name}"/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		
	</dt>
	<dd><div class="col-md-6">
		
	</div></dd>
</dl>
<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="prize2016EarlySummber.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${prize2016EarlySummberInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="prize2016EarlySummber.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="" value="${fieldValue(bean: prize2016EarlySummberInstance, field: 'amount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'index', 'error')} required">
	<label for="index">
		<g:message code="prize2016EarlySummber.index.label" default="Index" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="index" type="number" value="${prize2016EarlySummberInstance.index}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'luckyNum', 'error')} ">
	<label for="luckyNum">
		<g:message code="prize2016EarlySummber.luckyNum.label" default="Lucky Num" />
		
	</label>
	<g:textField name="luckyNum" value="${prize2016EarlySummberInstance?.luckyNum}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="prize2016EarlySummber.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${prize2016EarlySummberInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'positions', 'error')} ">
	<label for="positions">
		<g:message code="prize2016EarlySummber.positions.label" default="Positions" />
		
	</label>
	<g:textField name="positions" value="${prize2016EarlySummberInstance?.positions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="prize2016EarlySummber.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" value="${prize2016EarlySummberInstance.quantity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'quantityPerDay', 'error')} required">
	<label for="quantityPerDay">
		<g:message code="prize2016EarlySummber.quantityPerDay.label" default="Quantity Per Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantityPerDay" type="number" value="${prize2016EarlySummberInstance.quantityPerDay}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prize2016EarlySummberInstance, field: 'valuable', 'error')} ">
	<label for="valuable">
		<g:message code="prize2016EarlySummber.valuable.label" default="Valuable" />
		
	</label>
	<g:checkBox name="valuable" value="${prize2016EarlySummberInstance?.valuable}" />
</div>

