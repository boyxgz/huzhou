<%@ page import="com.surelution.huzhou.Prize2016EarlySummber" %>


<dl class="dl-horizontal">
	<dt>
		<label for="name">
			<g:message code="prize2016EarlySummber.name.label" default="Name" />
		</label>
	</dt>
	<dd><div class="col-md-6">
		<g:textField name="name" class="form-control" value="${prize2016EarlySummberInstance?.name}"/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="description">
		<g:message code="prize2016EarlySummber.description.label" default="Description" />
	</label>
	</dt>
	<dd><div class="col-md-6">
		<g:textField name="description" class="form-control" value="${prize2016EarlySummberInstance?.description}"/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="amount">
		<g:message code="prize2016EarlySummber.amount.label" default="Amount" />
	</label>
	</dt>
	<dd><div class="col-md-6">
		<g:field name="amount" type="" class="form-control" value="${fieldValue(bean: prize2016EarlySummberInstance, field: 'amount')}" required=""/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="quantity">
		<g:message code="prize2016EarlySummber.quantity.label" default="Quantity" />
	</label>
	</dt>
	<dd><div class="col-md-6">
		<g:field name="quantity" type="number" class="form-control" value="${prize2016EarlySummberInstance.quantity}" required=""/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="luckyNum">
		<g:message code="prize2016EarlySummber.luckyNum.label" default="Lucky Num" />
		
	</label>
	
	</dt>
	<dd><div class="col-md-6">
		<g:textField name="luckyNum" class="form-control" value="${prize2016EarlySummberInstance?.luckyNum}"/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="quantityPerDay">
		<g:message code="prize2016EarlySummber.quantityPerDay.label" default="Quantity Per Day" />
	</label>
	
	</dt>
	<dd><div class="col-md-6">
		<g:field name="quantityPerDay" type="number" class="form-control" value="${prize2016EarlySummberInstance.quantityPerDay}" required=""/>
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="index">
		<g:message code="prize2016EarlySummber.index.label" default="Index" />
	</label>
	
	</dt>
	<dd><div class="col-md-6">
		<g:field name="index" type="number" class="form-control"  value="${prize2016EarlySummberInstance.index}" required=""/>	
	</div></dd>
</dl>
<dl class="dl-horizontal">
	<dt>
		<label for="positions">
		<g:message code="prize2016EarlySummber.positions.label" default="Positions" />
		
	</label>
	</dt>
	<dd><div class="col-md-6">
		<g:textField name="positions" class="form-control" value="${prize2016EarlySummberInstance?.positions}"/>		
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
