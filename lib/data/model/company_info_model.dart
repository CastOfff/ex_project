class CompanyInfoModel {
  String name;
  String address;
  String gpk;
  String phoneNumber;
  String email;

  CompanyInfoModel(
      this.name,
      this.address,
      this.gpk,
      this.phoneNumber,
      this.email,
      );
}

CompanyInfoModel companyInfoMockData = CompanyInfoModel(
    'Golden Gate Trading Service Joint Stock Company',
    'Head office: No. 60 Pho Duc Chinh Street, Nguyen Thai Binh Ward, District 1, HCMC, Vietnam',
    'GPK: 0102721191 issued on 09/04/2008',
    'Tel: 043 222 3000',
    'Email: support@anbbq.com.vn');