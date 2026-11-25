import { Browser } from '@capacitor/browser'
import { Toast } from '@capacitor/toast'

const log = document.getElementById('log')

document.getElementById('toast').addEventListener('click', () => {
  Toast.show({ text: 'Toast without a presented view controller', duration: 'long', position: 'center' })
})

document.getElementById('browser').addEventListener('click', async () => {
  const openedAt = Date.now()
  const seconds = () => ((Date.now() - openedAt) / 1000).toFixed(1)
  log.textContent = ''
  setTimeout(async () => {
    const calledAt = seconds()
    await Toast.show({ text: 'Toast while Browser is open', duration: 'long', position: 'center' })
    log.textContent = `Toast.show() called at ${calledAt}s, resolved at ${seconds()}s (Browser opened at 0s)`
  }, 3000)
  await Browser.open({ url: 'https://capacitorjs.com' })
})
