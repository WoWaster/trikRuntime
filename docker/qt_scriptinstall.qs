function Controller() {
  installer.autoRejectMessageBoxes();
}

Controller.prototype.WelcomePageCallback = function() {
  gui.clickButton(buttons.NextButton, 3000);
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function() {
  gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.value("HomeDir") + "/Qt_auto");
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
  gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
  gui.clickButton(buttons.NextButton);  
}

Controller.prototype.ComponentSelectionPageCallback = function() {
  var widget = gui.currentPageWidget();
  
  widget.deselectAll();
  widget.selectComponent("qt.tools.ifw.30");
  widget.selectComponent("qt.qt5.5122.gcc_64");
  widget.selectComponent("qt.qt5.5122.qtscript");
  
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
  gui.clickButton(buttons.CommitButton);
  installer.installationFinished.connect(function() {
    gui.clickButton(buttons.NextButton);
  });
}

Controller.prototype.FinishedPageCallback = function() {
  var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm; 
  if (checkBoxForm) {
    checkBoxForm.launchQtCreatorCheckBox.setChecked(false);
  }
  else {
    gui.currentPageWidget().RunItCheckBox.setChecked(false);
  }
  gui.clickButton(buttons.FinishButton);
}
