import twilio from 'twilio';
import logger from './log';

import config from '../config';
export interface SmsBody {
  to: string;
  mediaUrl?: Array<string>;
  body?: string;
}

export class SmsService {
  private static instance: SmsService;
  private static accountSid = config.TWILIO_ACCOUNT_SID;
  private static authToken = config.TWILIO_AUTH_TOKEN;
  private static phoneNumber = config.TWILIO_PHONE_NUMBER;

  constructor() {
    if (SmsService.instance instanceof SmsService) {
      return SmsService.instance;
    }
    SmsService.instance = this;
  }

  private createClient(to: string, body?: string, mediaUrl?: Array<string>) {
    return {
      to,
      body,
      mediaUrl,
      from: `${SmsService.phoneNumber}`,
    };
  }

  async send({ to, body, mediaUrl }: SmsBody): Promise<unknown> {
    if (!SmsService.accountSid || !SmsService.authToken) {
      logger.error(`Authentication is not availble.`);
      throw new Error(`Authentication is not availble `);
    }

    const client = twilio(SmsService.accountSid, SmsService.authToken);
    const smsClient = this.createClient(to, body, mediaUrl);

    if (!client && !smsClient) {
      logger.error(`client is not present to send sms.`);
      throw new Error(`client is not present to send sms.`);
    }

    return client.messages.create(smsClient);
  }
}
