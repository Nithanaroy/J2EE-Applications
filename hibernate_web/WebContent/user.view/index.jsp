<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap_2.css" rel="stylesheet" media="screen">
<title>Giris</title>
</head>
<body>
	<%
		String secim = session.getAttribute("secilen") + "";
	%>
	<table>
		<tr>
			<td style="width: 12cm; height: 11cm;"></td>
			<td>
				<table>
					<tr>
						<td>
							<form class="form-horizontal" method="post"
								action="islem_tamamla.jsp">
								<fieldset>
									<legend> Giriş </legend>
									<p>
									<p>
									<div class="control-group">
										<label class="control-label">Kullanici Adi : </label>
										<div class="controls">
											<input type="text" name="username"
												placeholder="Kullanici Adi">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Parola : </label>
										<div class="controls">
											<input type="text" name="password" placeholder="Parola">
										</div>
									</div>
									<div class="controls">
										<input type="submit" class="btn" style="width: 2.9cm;"
											value="Giriş Yap"> <input type="submit" class="btn"
											style="width: 2.8cm;" value="Kayıt Ol">
									</div>

								</fieldset>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>