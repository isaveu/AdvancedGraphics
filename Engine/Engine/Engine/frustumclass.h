#pragma once

#include <d3dx10math.h>

class FrustumClass
{
public:
    FrustumClass();
    FrustumClass(const FrustumClass& other);
    ~FrustumClass();

    void ConstructFrustum(float, D3DXMATRIX, D3DXMATRIX);
    
    bool CheckPoint(float, float, float);
    bool CheckCube(float, float, float, float);
    bool CheckSphere(float, float, float, float);
    bool CheckRectangle(float, float, float, float, float, float);

private:
    D3DXPLANE m_planes[6];
};