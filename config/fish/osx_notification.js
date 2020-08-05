function run([commandName, status, duration]) {
  const iterm = Application('iTerm2');
  // Don't show notification when iTerm is already the frontmost application.
  if (iterm.frontmost()) {
    return;
  }

  const app = Application.currentApplication();
  app.includeStandardAdditions = true

  const messagePrefix = status !== '0' ? 'Failed after' : 'Done in';
  const message = `${messagePrefix} ${duration} seconds.`;

  app.displayNotification(message, {
      withTitle: commandName,
  });
}
