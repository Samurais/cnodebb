<!-- IMPORT admin/settings/header.tpl -->

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Email Settings</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="form-group">
				<label for="email:from"><strong>Email Address</strong></label>
				<p class="help-block">
					The following email address refers to the email that the recipient will see in the "From" and "Reply To" fields.
				</p>
				<input type="text" class="form-control input-lg" id="email:from" data-field="email:from" placeholder="info@example.org" /><br />
			</div>
			<div class="form-group">
				<label for="email:from_name"><strong>From Name</strong></label>
				<p class="help-block">
					The from name to display in the email.
				</p>
				<input type="text" class="form-control input-lg" id="email:from_name" data-field="email:from_name" placeholder="NodeBB" /><br />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">QQex Routing</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label for="email:QQexTransport:enabled" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" id="email:QQexTransport:enabled" data-field="email:QQexTransport:enabled" name="email:QQexTransport:enabled" />
					<span class="mdl-switch__label">Route emails through a QQex email account</span>
				</label>
			</div>
			<div class="form-group">
				<label for="email:QQexTransport:user"><strong>Username</strong></label>
				<input type="text" class="form-control input-lg" id="email:QQexTransport:user" data-field="email:QQexTransport:user" placeholder="admin@example.org" /><br />
				<p class="help-block">
					Enter the full email address here, especially if you are using a self-managed domain.
				</p>
			</div>
			<div class="form-group">
				<label for="email:QQexTransport:pass"><strong>Password</strong></label>
				<input type="password" class="form-control input-lg" id="email:QQexTransport:pass" data-field="email:QQexTransport:pass" /><br />
			</div>
		</form>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Edit Email Template</div>
	<div class="col-sm-10 col-xs-12">
		<label>Select Email Template</label><br />
		<select id="email-editor-selector" class="form-control">
			<!-- BEGIN emails -->
			<option value="{emails.path}">{emails.path}</option>
			<!-- END emails -->
		</select>
		<br />
		<div id="email-editor"></div>
		<input type="hidden" id="email-editor-holder" value="" data-field="" />
		<br />
		<button class="btn btn-warning" type="button" data-action="email.revert">Revert to Original</button>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Email Testing</div>
	<div class="col-sm-10 col-xs-12">
		<label>Select Email Template</label><br />
		<select id="test-email" class="form-control">
			<!-- BEGIN sendable -->
			<option value="{sendable.path}">{sendable.path}</option>
			<!-- END sendable -->
		</select><br />
		<button class="btn btn-primary" type="button" data-action="email.test">Send Test Email</button>
		<p class="help-block">
			The test email will be sent to the currently logged in user's email address.
		</p>
	</div>
</div>

<div class="row">
	<div class="col-sm-2 col-xs-12 settings-header">Email Subscriptions</div>
	<div class="col-sm-10 col-xs-12">
		<form>
			<div class="checkbox">
				<label for="disableEmailSubscriptions" class="mdl-switch mdl-js-switch mdl-js-ripple-effect">
					<input class="mdl-switch__input" type="checkbox" id="disableEmailSubscriptions" data-field="disableEmailSubscriptions" name="disableEmailSubscriptions" />
					<span class="mdl-switch__label">Disable subscriber notification emails</span>
				</label>
			</div>
		</form>
	</div>
</div>

<!-- IMPORT admin/settings/footer.tpl -->