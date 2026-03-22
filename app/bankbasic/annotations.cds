using PropagationService as service from '../../srv/service';
annotate service.BankBasic with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bukrs,
            },
            {
                $Type : 'UI.DataField',
                Value : hbkid,
            },
            {
                $Type : 'UI.DataField',
                Value : banks,
            },
            {
                $Type : 'UI.DataField',
                Value : bankl,
            },
            {
                $Type : 'UI.DataField',
                Value : banka,
            },
            {
                $Type : 'UI.DataField',
                Label : 'buser',
                Value : buser,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'PropagationService.SendToBank',
            Label : '통신모듈 API'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'PropagationService.SendToBank2',
            Label : '대표님 전송 테스트'
        },
        {
            $Type : 'UI.DataField',
            Value : hbkid,
        },
        {
            $Type : 'UI.DataField',
            Value : bukrs,
        },
        {
            $Type : 'UI.DataField',
            Value : banks,
        },
        {
            $Type : 'UI.DataField',
            Value : bankl,
        },
        {
            $Type : 'UI.DataField',
            Value : banka,
        },
    ],
);

