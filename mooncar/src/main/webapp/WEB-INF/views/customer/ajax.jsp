<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                 
                //�˻��ϰ� ���� ����� �����ٶ� �˻� ������ �״�� ����
                //if("${serviceType}" == "sports"){ //serviceType �� sport �� ��� ����
                if("sports" == "sports"){
                 
                    //���� ��ư ������ ����
                    $('input:radio[name="serviceType"][value="sports"]').prop('checked', true);
                    //����/���� ī�װ� hide
                    $( "#viewConcertCategory" ).hide();
                    //������ ī�װ� show
                    $( "#viewSportCategory" ).show();
                }
                 
                //���� ��ư ����� �̺�Ʈ
                $("input[name='serviceType']:radio").change(function () {
                        //���� ��ư ���� �����´�.
                        var serviceType = this.value;
                                         
                        if(serviceType == "sports"){//�������� ���
                            //������ �϶� ����/���� ī�װ� hide
                            $( "#viewConcertCategory" ).hide();
                            //������ �϶� ������ ī�װ� show
                            $( "#viewSportCategory" ).show();
                        }else if(serviceType == "concert"){//����/������ ���
                            //����/���� �϶� ����/���� ī�װ� show
                            $( "#viewConcertCategory" ).show();
                            //����/���� �϶� ������ ī�װ� show
                            $( "#viewSportCategory" ).hide();
                        }
                                         
                    });
            });
        </script>
    </head>
    <body>
        <input type="radio" name="serviceType" value="concert" checked><span> ����/����</span>
        <input type="radio" name="serviceType" value="sports"><span> ������</span>
        <br>
        <br>
        <span id="viewConcertCategory">
            ����/���� ī�װ�: 
        </span>
        <span id="viewSportCategory" style="display:none">
            ������ ī�װ�: 
           
        </span>
    </body>
</html>