program GCSoft;



uses
  Forms,
  sysutils,
  Persistence in 'Application\Dao\Persistence\Persistence.pas' {dao: TDataModule},
  CommunDao in 'Application\Dao\Commun\CommunDao.pas' {commonDao: TDataModule},
  UMdAdmin in 'Application\Dao\Modules\Belzama\UMdAdmin.pas' {MdAdmin: TDataModule},
  DegaDao in 'Application\Dao\Modules\Dega\DegaDao.pas' {MdDega: TDataModule},
  JPDao in 'Application\Dao\Modules\JeanPaul\JPDao.pas' {MdJP: TDataModule},
  GeorgesDao in 'Application\Dao\Modules\Winiga\GeorgesDao.pas' {MdGeorges: TDataModule},
  CryptageService in 'Application\Services\Commons\CryptageService.pas',
  ExcelService in 'Application\Services\Commons\ExcelService.pas',
  MathService in 'Application\Services\Commons\MathService.pas',
  StringService in 'Application\Services\Commons\StringService.pas',
  WindowsService in 'Application\Services\Commons\WindowsService.pas',
  DaoService in 'Application\Services\Dao\DaoService.pas',
  FormService in 'Application\Services\FormUtil\FormService.pas',
  BelzamaFonction in 'Application\Services\Modules\Belzama\BelzamaFonction.pas',
  fonctionAdmin in 'Application\Services\Modules\Belzama\fonctionAdmin.pas',
  GeorgesFonction in 'Application\Services\Modules\Winiga\GeorgesFonction.pas',
  UFApropos in 'Application\SrcFiles\Commun\UFApropos.pas' {FApropos},
  UFSplash in 'Application\SrcFiles\Commun\UFSplash.pas' {FSplash},
  UMainForm in 'Application\SrcFiles\Commun\UMainForm.pas' {MainForm},
  UFSamples in 'Application\SrcFiles\Samples\UFSamples.pas' {FSamples},
  UFTheme in 'Application\SrcFiles\Commun\UFTheme.pas' {FTheme},
  UFChangerMDP in 'Application\SrcFiles\Commun\UFChangerMDP.pas' {FChangerMDP},
  ULogin in 'Application\SrcFiles\Commun\ULogin.pas' {FLogin},
  UFGestionDroitAcces in 'Application\SrcFiles\Modules\Admin\UFGestionDroitAcces.pas' {FGestionDroitAcces},
  UFGestionFonctionMenu in 'Application\SrcFiles\Modules\Admin\UFGestionFonctionMenu.pas' {FGestionFonctionMenu},
  UFGestionUtilisateur in 'Application\SrcFiles\Modules\Admin\UFGestionUtilisateur.pas' {FGestionUtilisateur},
  UFSysParam in 'Application\SrcFiles\Modules\Admin\UFSysParam.pas' {FSysParam},
  UFUpdater in 'Application\SrcFiles\Modules\Admin\UFUpdater.pas' {FUpdater},
  UFConfigConnex in 'Pconnex\UFConfigConnex.pas' {FConfigConnex},
  UFBanque in 'Application\SrcFiles\Recup\UFBanque.pas' {FBanque},
  UFClient in 'Application\SrcFiles\Recup\UFClient.pas' {FClient},
  UFCommande in 'Application\SrcFiles\Recup\UFCommande.pas' {FCommande},
  UFDetailCommande in 'Application\SrcFiles\Recup\UFDetailCommande.pas' {FDetailCommande},
  UFFournisseur in 'Application\SrcFiles\Recup\UFFournisseur.pas' {FFournisseur},
  UFLivraison in 'Application\SrcFiles\Recup\UFLivraison.pas' {FLivraison},
  UFLivraisonCmde in 'Application\SrcFiles\Recup\UFLivraisonCmde.pas' {FLivraisonCmde},
  UFLivraisonStock in 'Application\SrcFiles\Recup\UFLivraisonStock.pas' {FLivraisonStock},
  UFMagasin in 'Application\SrcFiles\Recup\UFMagasin.pas' {FMagasin},
  UFMajCommande in 'Application\SrcFiles\Recup\UFMajCommande.pas' {FMajCommande},
  UFModeReglement in 'Application\SrcFiles\Recup\UFModeReglement.pas' {FModeReglement},
  UFProduit in 'Application\SrcFiles\Recup\UFProduit.pas' {FProduit},
  UFSaisieStock in 'Application\SrcFiles\Recup\UFSaisieStock.pas' {FSaisieStock},
  UFValiderCommande in 'Application\SrcFiles\Recup\UFValiderCommande.pas' {FValiderCommande},
  UMdMaz in 'Application\Dao\Commun\UMdMaz.pas' {MdMaz: TDataModule},
  UFAgent in 'Application\SrcFiles\Recup\UFAgent.pas' {FAgent},
  UFSystemeLog in 'Application\SrcFiles\Modules\Dega\UFSystemeLog.pas' {FJournalSysteme},
  sysParam in 'Application\Dao\Entities\sysParam.pas',
  sysParamBis in 'Application\Dao\Entities\sysParamBis.pas',
  UFAnnulCmdeClient in 'Application\SrcFiles\Modules\Belzama\UFAnnulCmdeClient.pas' {FAnnulCmdeClient},
  UFCmdeClient in 'Application\SrcFiles\Modules\Belzama\UFCmdeClient.pas' {FCmdeClient},
  UFDetailCmdeClient in 'Application\SrcFiles\Modules\Belzama\UFDetailCmdeClient.pas' {FDetailCmdeClient},
  UFLivraisonClient in 'Application\SrcFiles\Modules\Belzama\UFLivraisonClient.pas' {FLivraisonClient},
  UFSaisieCmdeClient in 'Application\SrcFiles\Modules\Belzama\UFSaisieCmdeClient.pas' {FSaisieCmdeClient},
  UFSaisieLivrClient in 'Application\SrcFiles\Modules\Belzama\UFSaisieLivrClient.pas' {FSaisieLivrClient},
  UFProforma in 'Application\SrcFiles\Modules\Belzama\UFProforma.pas' {FProforma},
  UFSaisieProforma in 'Application\SrcFiles\Modules\Belzama\UFSaisieProforma.pas' {FSaisieProforma},
  UFValCmdeClient in 'Application\SrcFiles\Modules\Belzama\UFValCmdeClient.pas' {FValCmdeClient},
  UFAnnulerCommande in 'Application\SrcFiles\Modules\Winiga\UFAnnulerCommande.pas' {FAnnulerCommande},
  UFWaitingGradient in 'Application\SrcFiles\Commun\UFWaitingGradient.pas' {FWaitingGradient},
  UFProduitFini in 'Application\SrcFiles\Modules\JeanPaul\UFProduitFini.pas' {FProduitFini},
  UFUniteMesure in 'Application\SrcFiles\Modules\JeanPaul\UFUniteMesure.pas' {FUniteMesure},
  UFDetailLivrClient in 'Application\SrcFiles\Modules\Belzama\UFDetailLivrClient.pas' {FDetailLivrClient},
  UFGenererFacture in 'Application\SrcFiles\Modules\Belzama\UFGenererFacture.pas' {FGenererFacture},
  UFTypeProduit in 'Application\SrcFiles\Modules\JeanPaul\UFTypeProduit.pas' {FTypeProduit},
  AdoQueryThread in 'Application\Dao\Thread\AdoQueryThread.pas',
  UFCompoProdFini in 'Application\SrcFiles\Modules\JeanPaul\UFCompoProdFini.pas' {FCompoProdFini},
  UFTarifAchat in 'Application\SrcFiles\Modules\JeanPaul\UFTarifAchat.pas' {FTarifAchat},
  UFAnnulerFacture in 'Application\SrcFiles\Modules\Belzama\UFAnnulerFacture.pas' {FAnnulerFacture},
  UFDetailFacture in 'Application\SrcFiles\Modules\Belzama\UFDetailFacture.pas' {FDetailFacture},
  UFEditerFacture in 'Application\SrcFiles\Modules\Belzama\UFEditerFacture.pas' {FEditerFacture},
  UFValiderFacture in 'Application\SrcFiles\Modules\Belzama\UFValiderFacture.pas' {FValiderFacture},
  UFStockInitProduit in 'Application\SrcFiles\Modules\JeanPaul\UFStockInitProduit.pas' {FStockInitProduit},
  UFStockInitProduitFini in 'Application\SrcFiles\Modules\JeanPaul\UFStockInitProduitFini.pas' {FStockInitProduitFini},
  UFTarifVente in 'Application\SrcFiles\Modules\JeanPaul\UFTarifVente.pas' {FTarifVente},
  UFCreateInventaireProd in 'Application\SrcFiles\Modules\JeanPaul\UFCreateInventaireProd.pas' {FCreateInventaireProd},
  UFCreateInventaireProdFini in 'Application\SrcFiles\Modules\JeanPaul\UFCreateInventaireProdFini.pas' {FCreateInventaireProdFini},
  UFInventaireProd in 'Application\SrcFiles\Modules\JeanPaul\UFInventaireProd.pas' {FInventaireProd},
  UFInventaireProdFini in 'Application\SrcFiles\Modules\JeanPaul\UFInventaireProdFini.pas' {FInventaireProdFini},
  UFMiseEnStockProduit in 'Application\SrcFiles\Modules\JeanPaul\UFMiseEnStockProduit.pas' {FMiseEnStockProduit},
  UFMiseEnStockProduitFini in 'Application\SrcFiles\Modules\JeanPaul\UFMiseEnStockProduitFini.pas' {FMiseEnStockProduitFini},
  UFViewInventaireProd in 'Application\SrcFiles\Modules\JeanPaul\UFViewInventaireProd.pas' {FViewInventaireProd},
  UFViewInventaireProdFini in 'Application\SrcFiles\Modules\JeanPaul\UFViewInventaireProdFini.pas' {FViewInventaireProdFini},
  UFReinitStockProduit in 'Application\SrcFiles\Modules\JeanPaul\UFReinitStockProduit.pas' {FReinitStockProduit},
  UFReinitStockProduitFini in 'Application\SrcFiles\Modules\JeanPaul\UFReinitStockProduitFini.pas' {FReinitStockProduitFini},
  UFStockTheorique in 'Application\SrcFiles\Modules\JeanPaul\UFStockTheorique.pas' {FStockTheorique},
  BeleiDao in 'Application\Dao\Modules\Belzama\BeleiDao.pas' {MdBelei: TDataModule},
  commandeClient in 'Application\Dao\Entities\commandeClient.pas',
  detCmdeClient in 'Application\Dao\Entities\detCmdeClient.pas',
  UFTransfertProduit in 'Application\SrcFiles\Modules\JeanPaul\UFTransfertProduit.pas' {FTransfertProduit},
  UFTransfertProduitFini in 'Application\SrcFiles\Modules\JeanPaul\UFTransfertProduitFini.pas' {FTransfertProduitFini},
  UFRuptureStock in 'Application\SrcFiles\Modules\JeanPaul\UFRuptureStock.pas' {FRuptureStock},
  UFReglerFacture in 'Application\SrcFiles\Modules\Winiga\UFReglerFacture.pas' {FReglerFacture},
  UFListeCommandeClient in 'Application\SrcFiles\Modules\JeanPaul\UFListeCommandeClient.pas' {FListeCommande},
  UFListeFacture in 'Application\SrcFiles\Modules\JeanPaul\UFListeFacture.pas' {FListeFacture},
  UFListeBonLivraison in 'Application\SrcFiles\Modules\JeanPaul\UFListeBonLivraison.pas' {FListeBonLivraison},
  UFTableauBord in 'Application\SrcFiles\Modules\JeanPaul\UFTableauBord.pas' {FTableauBord},
  UFJournalReglement in 'Application\SrcFiles\Modules\JeanPaul\UFJournalReglement.pas' {FJournalReglement},
  UFListeClientRedevable in 'Application\SrcFiles\Modules\JeanPaul\UFListeClientRedevable.pas' {FListeClientRedevable},
  UFListeEtatDiff in 'Application\SrcFiles\Modules\JeanPaul\UFListeEtatDiff.pas' {FListeEtatDiff},
  UFChronoApp in 'Application\SrcFiles\Modules\JeanPaul\UFChronoApp.pas' {FChronoApp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

 FormatSettings.DecimalSeparator:='.';

   try
  Application.Title := 'GCSoft '+ApplicationVersion;
  except
  Application.Title := 'GCSoft';
  end;

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFSplash, FSplash);
  Application.CreateForm(TFApropos, FApropos);
  Application.CreateForm(TFSamples, FSamples);
  Application.CreateForm(TFTheme, FTheme);
  Application.CreateForm(TFChangerMDP, FChangerMDP);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFGestionDroitAcces, FGestionDroitAcces);
  Application.CreateForm(TFGestionFonctionMenu, FGestionFonctionMenu);
  Application.CreateForm(TFGestionUtilisateur, FGestionUtilisateur);
  Application.CreateForm(TFSysParam, FSysParam);
  Application.CreateForm(TFUpdater, FUpdater);
  Application.CreateForm(TFConfigConnex, FConfigConnex);
  Application.CreateForm(TFBanque, FBanque);
  Application.CreateForm(TFClient, FClient);
  Application.CreateForm(TFCommande, FCommande);
  Application.CreateForm(TFDetailCommande, FDetailCommande);
  Application.CreateForm(TFFournisseur, FFournisseur);
  Application.CreateForm(TFLivraison, FLivraison);
  Application.CreateForm(TFLivraisonCmde, FLivraisonCmde);
  Application.CreateForm(TFLivraisonStock, FLivraisonStock);
  Application.CreateForm(TFMagasin, FMagasin);
  Application.CreateForm(TFMajCommande, FMajCommande);
  Application.CreateForm(TFModeReglement, FModeReglement);
  Application.CreateForm(TFProduit, FProduit);
  Application.CreateForm(TFSaisieStock, FSaisieStock);
  Application.CreateForm(TFValiderCommande, FValiderCommande);
  Application.CreateForm(TFAgent, FAgent);
  Application.CreateForm(TFJournalSysteme, FJournalSysteme);
  Application.CreateForm(TFAnnulCmdeClient, FAnnulCmdeClient);
  Application.CreateForm(TFCmdeClient, FCmdeClient);
  Application.CreateForm(TFDetailCmdeClient, FDetailCmdeClient);
  Application.CreateForm(TFLivraisonClient, FLivraisonClient);
  Application.CreateForm(TFSaisieCmdeClient, FSaisieCmdeClient);
  Application.CreateForm(TFSaisieLivrClient, FSaisieLivrClient);
  Application.CreateForm(TFProforma, FProforma);
  Application.CreateForm(TFSaisieProforma, FSaisieProforma);
  Application.CreateForm(TFValCmdeClient, FValCmdeClient);
  Application.CreateForm(TFAnnulerCommande, FAnnulerCommande);
  Application.CreateForm(TFWaitingGradient, FWaitingGradient);
  Application.CreateForm(TFProduitFini, FProduitFini);
  Application.CreateForm(TFUniteMesure, FUniteMesure);
  Application.CreateForm(TFDetailLivrClient, FDetailLivrClient);
  Application.CreateForm(TFGenererFacture, FGenererFacture);
  Application.CreateForm(TFTypeProduit, FTypeProduit);
  Application.CreateForm(TFCompoProdFini, FCompoProdFini);
  Application.CreateForm(TFTarifAchat, FTarifAchat);
  Application.CreateForm(TFAnnulerFacture, FAnnulerFacture);
  Application.CreateForm(TFDetailFacture, FDetailFacture);
  Application.CreateForm(TFEditerFacture, FEditerFacture);
  Application.CreateForm(TFValiderFacture, FValiderFacture);
  Application.CreateForm(TFStockInitProduit, FStockInitProduit);
  Application.CreateForm(TFStockInitProduitFini, FStockInitProduitFini);
  Application.CreateForm(TFTarifVente, FTarifVente);
  Application.CreateForm(TFCreateInventaireProd, FCreateInventaireProd);
  Application.CreateForm(TFCreateInventaireProdFini, FCreateInventaireProdFini);
  Application.CreateForm(TFInventaireProd, FInventaireProd);
  Application.CreateForm(TFInventaireProdFini, FInventaireProdFini);
  Application.CreateForm(TFMiseEnStockProduit, FMiseEnStockProduit);
  Application.CreateForm(TFMiseEnStockProduitFini, FMiseEnStockProduitFini);
  Application.CreateForm(TFViewInventaireProd, FViewInventaireProd);
  Application.CreateForm(TFViewInventaireProdFini, FViewInventaireProdFini);
  Application.CreateForm(TFReinitStockProduit, FReinitStockProduit);
  Application.CreateForm(TFReinitStockProduitFini, FReinitStockProduitFini);
  Application.CreateForm(TFStockTheorique, FStockTheorique);
  Application.CreateForm(TFTransfertProduit, FTransfertProduit);
  Application.CreateForm(TFTransfertProduitFini, FTransfertProduitFini);
  Application.CreateForm(TFRuptureStock, FRuptureStock);
  Application.CreateForm(TFReglerFacture, FReglerFacture);
  Application.CreateForm(TFListeCommande, FListeCommande);
  Application.CreateForm(TFListeFacture, FListeFacture);
  Application.CreateForm(TFListeBonLivraison, FListeBonLivraison);
  Application.CreateForm(TFTableauBord, FTableauBord);
  Application.CreateForm(TFJournalReglement, FJournalReglement);
  Application.CreateForm(TFListeClientRedevable, FListeClientRedevable);
  Application.CreateForm(TFListeEtatDiff, FListeEtatDiff);
  Application.CreateForm(TFChronoApp, FChronoApp);
  Application.CreateForm(Tdao, dao);
  Application.CreateForm(TcommonDao, commonDao);
  Application.CreateForm(TMdAdmin, MdAdmin);
  Application.CreateForm(TMdDega, MdDega);
  Application.CreateForm(TMdJP, MdJP);
  Application.CreateForm(TMdGeorges, MdGeorges);
  Application.CreateForm(TMdMaz, MdMaz);
  Application.CreateForm(TMdBelei, MdBelei);
  Application.CreateForm(TFTableauBord, FTableauBord);
  Application.CreateForm(TFListeBonLivraison, FListeBonLivraison);
  Application.CreateForm(TFListeClientRedevable, FListeClientRedevable);
  Application.CreateForm(TFListeCommande, FListeCommande);
  Application.CreateForm(TFListeFacture, FListeFacture);
  Application.CreateForm(TFTableauBord, FTableauBord);
  if not Persistence.ConnexFileIsCreate then
    FConfigConnex.Show;

  Application.Run;
end.
