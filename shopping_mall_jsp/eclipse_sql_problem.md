Plug-in org.eclipse.datatools.sqltools.result.ui was unable to load class org.eclipse.datatools.sqltools.result.internal.ui.view.ResultsView.

Following advise was helpful for me, so no re-installation was required. May it be changes in format of result history during Eclipse upgrade?

Go to work space directory > Open ".metadata" folder > Open ".plugins" folder > Open "org.eclipse.datatools.sqltools.result" folder.
Delete the "results" file.
Re-start the product and try again.
