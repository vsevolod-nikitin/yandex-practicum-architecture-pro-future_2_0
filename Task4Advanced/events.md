# Каталог доменных событий

## Клиенты и медицинские данные

### Контекст Customer

- **CustomerRegistered** — в системе появился новый клиент.  
  Обязательные данные: `customerId`, `name`, `email`, `phone`.
- **CustomerUpdated** — сведения о клиенте были изменены.  
  Обязательные данные: `customerId`, `changedFields`.

### Контекст Medical

- **PatientCreated** — для клиента завели медицинскую карту пациента.  
  Обязательные данные: `patientId`, `customerId`, `policyNumber`.
- **AppointmentScheduled** — для пациента назначили время визита к врачу.  
  Обязательные данные: `appointmentId`, `patientId`, `doctorId`, `time`.
- **AppointmentCompleted** — визит пациента завершился.  
  Обязательные данные: `appointmentId`, `outcome`.
- **DiagnosisRecorded** — в медицинскую карту внесли диагноз.  
  Обязательные данные: `diagnosisId`, `patientId`, `code`, `description`.
- **PrescriptionIssued** — пациенту оформили назначение препарата.  
  Обязательные данные: `prescriptionId`, `patientId`, `medication`, `dosage`.
- **ImagingStudyRequested** — для пациента назначили визуализирующее исследование, например МРТ или рентген.  
  Обязательные данные: `studyId`, `patientId`, `type`, `requestedAt`.
- **ImagingStudyCompleted** — исследование завершили, и результаты стали доступны.  
  Обязательные данные: `studyId`, `resultsUri`.

## Диагностика с помощью ИИ

### Контекст AI Diagnostics

- **AIAnalysisRequested** — исследование передали системе искусственного интеллекта для обработки.  
  Обязательные данные: `analysisId`, `studyId`, `modelVersion`.
- **AIAnalysisCompleted** — обработка закончилась, и система вернула заключение.  
  Обязательные данные: `analysisId`, `result`, `confidence`.

## Операционная работа клиники

### Контекст Inventory

- **InventoryItemUsed** — при оказании услуги израсходовали складскую позицию.  
  Обязательные данные: `itemId`, `quantity`; необязательное поле: `appointmentId`.
- **InventoryLow** — количество позиции на складе опустилось ниже установленной границы.  
  Обязательные данные: `itemId`, `currentQuantity`, `threshold`.

### Контекст Staff

- **StaffAssigned** — сотрудника закрепили за визитом или рабочей сменой.  
  Обязательные данные: `staffId` и один из идентификаторов: `appointmentId` либо `shiftId`.

## Финансовые события

### Контекст Fintech

- **AccountOpened** — для клиента создали банковский счёт.  
  Обязательные данные: `accountId`, `customerId`, `currency`.
- **LoanApplicationSubmitted** — клиент отправил заявку на получение кредита.  
  Обязательные данные: `loanId`, `customerId`, `amount`, `term`.
- **LoanApproved** — кредитную заявку одобрили.  
  Обязательные данные: `loanId`, `approvedAmount`, `rate`.
- **LoanDisbursed** — клиенту перечислили кредитные средства.  
  Обязательные данные: `loanId`, `disbursedAmount`, `date`.
- **TransactionPosted** — операцию по банковскому счёту зафиксировали.  
  Обязательные данные: `transactionId`, `accountId`, `amount`, `type`.

### Контекст Billing

- **InvoiceCreated** — клиенту сформировали счёт за оказанные услуги.  
  Обязательные данные: `invoiceId`, `patientId`, `amount`, `items`.
- **PaymentReceived** — по выставленному счёту поступили деньги.  
  Обязательные данные: `invoiceId`, `amount`, `paymentMethod`.
